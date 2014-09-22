class Teacher < ActiveRecord::Base

  has_many :teacher_lessons
  has_many :lessons, through: :teacher_lessons
  has_many :courses, through: :lessons
end
