class Lesson < ActiveRecord::Base
  DAYS = (0..4).to_a
  HOURS = (0..9).to_a

  has_many :room_lessons
  has_many :rooms, through: :room_lessons

  belongs_to :course
  has_many :teachers, through: :courses
end
