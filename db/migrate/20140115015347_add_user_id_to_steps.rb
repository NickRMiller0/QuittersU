class AddUserIdToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :user_id, :integer
    add_index :steps, :user_id
  end
end
