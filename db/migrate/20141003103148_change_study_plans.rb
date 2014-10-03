class ChangeStudyPlans < ActiveRecord::Migration
  def change
    remove_column :study_plans, :user_id, :integer
  end
end
