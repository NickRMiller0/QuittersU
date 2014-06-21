class AddUserIdToStepImages < ActiveRecord::Migration
  def change
    add_column :step_images, :user_id, :integer
    add_index :step_images, :user_id
  end
end
