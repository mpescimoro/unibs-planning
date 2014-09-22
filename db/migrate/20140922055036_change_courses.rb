class ChangeCourses < ActiveRecord::Migration
  def change
    add_column :degrees, :master, :boolean
    remove_column :courses, :master, :boolean
    add_column :courses, :degree_id, :integer
  end
end
