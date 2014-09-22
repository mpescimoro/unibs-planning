class DeleteUselessColumns < ActiveRecord::Migration
  def change
    remove_column :courses, :degree, :string
    remove_column :courses, :area, :string
    remove_column :lessons, :room, :string
  end
end
