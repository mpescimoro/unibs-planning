class RoomLesson < ActiveRecord::Base

  belongs_to :room
  belongs_to :lesson
end
