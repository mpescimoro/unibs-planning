class TeacherLesson < ActiveRecord::Base

  belongs_to :teacher
  belongs_to :lesson
end
