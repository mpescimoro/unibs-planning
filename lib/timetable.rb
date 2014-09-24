class Timetable

  def initialize(courses=nil)
    @days = []

    if courses
      Lesson::DAYS.each do |day|
        @days << TimetableDay.new(day)
        courses.each do |course|
          @days.last.add_lessons(course.lessons.where(day: day))
        end
      end
    end
  end

  def add_course(course)
    course.lessons.each do |lesson|
      @days[lesson.day].add_lesson(lesson)
    end
  end

  def remove_course(course)
    @days.each do |day|
      day.remove_course(course)
    end
  end

  def each_day
    @days.each do |day|
      yield(day)
    end
  end

  def day(day)
    @days[day]
  end

  def empty?
    @days.empty?
  end

  class TimetableDay

    attr_reader :columns_count, :number

    def initialize(number, lessons=nil)
      @number = number
      @columns_count = 0
      @table = Lesson::HOURS.map { Array.new }

      add_lessons(lessons) if lessons
    end

    def add_lessons(lessons)
      column = 0
      lessons.each do |lesson|
        column = column+1 unless @table[lesson.hour][column].nil?
      end
      lessons.each do |lesson|
        @table[lesson.hour][column] = lesson
      end

      @columns_count = [@columns_count, column+1].max
    end

    def remove_course(course)
      @table.each do |hours|
        hours.delete_if { |lesson| lesson and lesson.course_id == course.id }
      end

      columns.each do |column| # remove nil columns
        if Lesson::HOURS.all? { |hour| @table[hour][column].nil? }
          Lesson::HOURS.each do |hour|
            @table[hour].delete_at(column)
          end
          @columns_count = @columns_count-1
        end
      end

      @columns_count
    end

    def each_hour
      @table.each do |hour|
        yield(hour)
      end
    end

    def [](i)
      @table[i]
    end

    def columns
      (0..(@columns_count-1)).to_a
    end
  end
end

