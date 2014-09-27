module StudyPlansHelper
  def timetable_hour_row(hour, timetable_id)
    html = ''
    hour.each_with_index do |daily_lessons, day|
      daily_lessons.each do |lesson|
        html << (lesson ? lesson_td(lesson, timetable_id) :  empty_lesson_td)
      end
      html << separator unless day == Lesson::DAYS.last
    end
    html.html_safe
  end

  def lesson_td(lesson, timetable_id)
    content_tag :td, class: lesson_class(lesson), style: "background-color: \##{lesson.color(timetable_id)}" do
      "#{lesson.course.name}</br></br><b>#{lesson.rooms.map(&:name).join ', '}<b>".html_safe
    end
  end

  def empty_lesson_td
    content_tag :td, '', class: 'empty'
  end

  def separator
    content_tag(:td, class: 'separator') { '' }
  end

  def lesson_class(lesson)
    if lesson.first and !lesson.last
      'top'
    elsif lesson.last and !lesson.first
      'bot'
    elsif lesson.last and lesson.first
      'single'
    else
      'mid'
    end
  end

  def color_dot_for(color)
    content_tag(:div, '', class: 'color-dot', style: "background-color: \##{color.hex}").html_safe
  end
end
