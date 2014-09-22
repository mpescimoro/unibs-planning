class Room < ActiveRecord::Base

  has_many :room_lessons
  has_many :lessons, through: :room_lessons
  has_many :courses, through: :lessons
end
