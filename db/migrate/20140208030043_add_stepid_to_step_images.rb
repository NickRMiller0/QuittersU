class AddStepidToStepImages < ActiveRecord::Migration
  def change
    add_column :step_images, :step_id, :integer
    add_index :step_images, :step_id
  end
end
