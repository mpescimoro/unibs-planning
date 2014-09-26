module StudyPlansHelper
  def timetable_hour_row(hour)
    html = ''
    hour.each_with_index do |daily_lessons, day|
      daily_lessons.each do |lesson|
        html << lesson_td(lesson)
      end
      html << separator unless day == Lesson::DAYS.last
    end
    html.html_safe
  end

  def lesson_td(lesson)
    content_tag :td, class: lesson_class(lesson) do
      lesson ? "#{lesson.course.name}</br></br><b>#{lesson.rooms.map(&:name).join ', '}<b>".html_safe : ''
    end
  end

  def separator
    content_tag(:td, class: 'separator') { '' }
  end

  def lesson_class(lesson)
    return 'empty' unless lesson
    if lesson.first and !lesson.last
      'top'
    elsif lesson.last and !lesson.first
      'bottom'
    elsif lesson.last and lesson.first
      'single'
    else
      'mid'
    end
  end
end
