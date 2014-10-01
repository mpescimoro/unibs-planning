class AddFieldsToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :human_name, :string
    add_column :degrees, :short_name, :string
  end
end
