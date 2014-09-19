class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :course_id
      t.integer :hour
      t.integer :day
      t.string :room

      t.timestamps
    end
  end
end
