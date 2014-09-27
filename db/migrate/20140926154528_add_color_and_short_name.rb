class AddColorAndShortName < ActiveRecord::Migration
  def change
    add_column :study_plan_courses, :color_id, :integer
    add_column :study_plan_courses, :short_name, :string
  end
end
