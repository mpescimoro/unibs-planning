class Lesson < ActiveRecord::Base

  has_many :teacher_lessons
  has_many :teachers, through: :teacher_lessons

  has_many :room_lessons
  has_many :rooms, through: :room_lessons

  belongs_to :course
end
