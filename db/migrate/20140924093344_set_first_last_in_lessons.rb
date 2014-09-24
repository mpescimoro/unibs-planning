class SetFirstLastInLessons < ActiveRecord::Migration

  def up
    Course.all.each do |course|
      course.lessons.each do |lesson|
        lesson.first = false
        lesson.last = false
        lesson.first = true if course.lessons.where(day: lesson.day, hour: lesson.hour-1).first.nil?
        lesson.last = true if course.lessons.where(day: lesson.day, hour: lesson.hour+1).first.nil?
        lesson.save
      end
    end
  end

  def down
    Lesson.all.each do |lesson|
      lesson.first = nil
      lesson.last = nil
      lesson.save
    end
  end
end
