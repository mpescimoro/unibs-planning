class CreateStudyPlans < ActiveRecord::Migration
  def change
    create_table :study_plans do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
