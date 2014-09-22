class Lesson < ActiveRecord::Base

  has_many :room_lessons
  has_many :rooms, through: :room_lessons

  belongs_to :course
  has_many :teachers, through: :courses
end
