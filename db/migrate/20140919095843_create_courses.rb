class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :year
      t.boolean :semester
      t.boolean :master
      t.string :degree
      t.string :area
      t.integer :degree_year

      t.timestamps
    end
  end
end
