class ChangeCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :master, :boolean
    add_column :courses, :degree_id, :integer
  end
end
