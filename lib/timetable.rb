class Timetable

  attr_reader :columns_count

  def initialize(courses=[])
    @table = Array.new(Lesson::DAYS.count).map! do
      Array.new(Lesson::HOURS.count).map! { Array.new }
    end
    @columns_count = 0

    courses.each do |course|
      add_course(course)
    end
  end

  def add_course(course)
    column = 0
    course.lessons.each do |lesson|
      column = column+1 unless @table[lesson.day][lesson.hour][column].nil?
    end
    course.lessons.each do |lesson|
      @table[lesson.day][lesson.hour][column] = lesson
    end

    @columns_count = [@columns_count, column+1].max
  end

  def remove_course(course)
    @table.each do |daily_lessons|
      daily_lessons.each do |hourly_lessons|
        hourly_lessons.delete_if { |lesson| lesson and lesson.course_id == course.id }
      end
    end

    Lesson::DAYS.each do |day|
      for column in (0..(@columns_count-1))
        if Lesson::HOURS.all? { |hour| @table[day][hour][column].nil? }
          Lesson::HOURS.each do |hour|
            @table[day][hour].delete_at(column)
          end
          @columns_count = @columns_count-1
        end
      end
    end
    @columns_count
  end

  def day(day)
    @table[day]
  end

  def [](i)
    @table[i]
  end

end

