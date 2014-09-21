class CreateRoomLessons < ActiveRecord::Migration
  def change
    create_table :room_lessons do |t|
      t.integer :room_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
