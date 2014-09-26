class Lesson < ActiveRecord::Base
  DAYS = (0..4).to_a
  DAYS_NAMES = %w{L Ma Me G V}
  HOURS = (0..9).to_a
  HOURS_NAMES = HOURS.map { |h| "#{h+8}:30" }

  has_many :room_lessons
  has_many :rooms, through: :room_lessons

  belongs_to :course
  has_many :teachers, through: :courses
end
