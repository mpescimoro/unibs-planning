class AddSpReferenceToUser < ActiveRecord::Migration
  def change
    add_column :users, :study_plan_id, :integer
  end
end
