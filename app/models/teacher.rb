class Teacher < ActiveRecord::Base

  has_many :teacher_courses
  has_many :courses, through: :teacher_courses
  has_many :lessons, through: :courses
end
