class AddFirstLastToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :first, :boolean
    add_column :lessons, :last, :boolean
  end
end
