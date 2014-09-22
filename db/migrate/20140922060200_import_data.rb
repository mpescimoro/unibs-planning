class ImportData < ActiveRecord::Migration
  require 'nokogiri'

  def up
    global_info = {}

    @path = './raw_html/ingegneria'
    Dir.entries(@path).each do |file_name|
      info = file_name.split '_'
      if 0 < info[2].to_i and info[2].to_i < 4
        global_info[:degree] = info[0]
        global_info[:path] = info[1]
        global_info[:year] = info[2]
        global_info[:area] = 'Ingegneria'
        parse_html_timetable(file_name, global_info)
      end
    end

    @path = './raw_html/economia'
    Dir.entries(@path).each do |file_name|
      info = file_name.split '_'
      if 0 < info[2].to_i and info[2].to_i < 4
        global_info[:degree] = info[0]
        global_info[:path] = info[1]
        global_info[:year] = info[2]
        global_info[:area] = 'Economia'
        parse_html_timetable(file_name, global_info)
      end
    end
  end

  def down
    Course.delete_all
    Degree.delete_all
    Lesson.delete_all
    Room.delete_all
    RoomLesson.delete_all
    StudyPlan.delete_all
    StudyPlanCourse.delete_all
    Teacher.delete_all
    TeacherLesson.delete_all
  end

  def save_in_db(h, global_info)
    unless @degree = Degree.where(name: global_info[:degree], master: h[:master]).first
      @degree = Degree.new(name: global_info[:degree], area: global_info[:area], master: h[:master])
    end

    unless @course = Course.where(name: h[:course], degree_id: @degree.id).first
      @course = @degree.courses.build(name: h[:course], degree_year: global_info[:year], year: 2014, semester: false)
    end

    @lesson = @course.lessons.build(day: h[:day], hour: h[:hour])

    h[:teachers].each do |teacher_array|
      unless @teacher = Teacher.where(name: teacher_array[0], surname: teacher_array[1]).first
        @teacher = Teacher.new(name: teacher_array[0], surname: teacher_array[1])
        @teacher.lessons.append @lesson
        @teacher.save
      end
    end

    h[:rooms].each do |room_name|
      unless @room = Room.where(name: room_name).first
        @room = Room.new(name: room_name)
        @room.lessons.append @lesson
        @room.save
      end
    end

    @lesson.save
    @course.save
    @degree.save
  end

  def parse_html_timetable(file_name, global_info)
    page = Nokogiri::HTML open(@path + '/' + file_name)
    timetable = page.css("table[class='general']")[0]

    days = 0..4
    hours = 0..9
    h = {}

    days.each do |day|
      hours.each do |hour|
        class_info = timetable.css "table#parent_#{day}_#{hour}"

        unless class_info.text.empty?
          h[:course] = class_info.css('td.subject_pos1').text
          h[:teachers] = class_info.css('td.subject_pos2').text.split ' / '
          h[:teachers].map! { |t| parse_teacher_name(t) }
          h[:rooms] = format_rooms(class_info.css('td.subject_pos3').text)
          h[:day] = day
          h[:hour] = hour
          h[:master] = global_info[:path].include?('Magistrale') or global_info[:path].include?('magistrale')

          save_in_db(h, global_info)
        end
      end
    end
  end

  def format_rooms(string)
    string.gsub! 'Aula', ''
    string.gsub! 'AULA', ''
    string.gsub! 'Magna S. Chiara', 'MagnaSC'

    string.split('[')[0].split('+').map! do |room|
      room.strip!
      i = room.index(/[A-z]\.\d/) # toglie il . in "N.1"
      room.slice!(i+1) if i
      i = room.index(/[Bb]\s\d/)  # toglie lo spazio in "B 0.2"
      room.slice!(i+1) if i
      i = room.index(/[Bb]\d\d/)  # aggiunge . in "B02"
      room = room.insert(i+2, '.') if i
      room
    end
  end

  def parse_teacher_name(string)
    splitted = string.split ' '
    sur = splitted.pop
    [splitted.join(' '), sur]
  end
end
