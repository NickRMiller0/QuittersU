class AddPinIdToStepImages < ActiveRecord::Migration
  def change
    add_column :step_images, :pin_id, :integer
  end
end
