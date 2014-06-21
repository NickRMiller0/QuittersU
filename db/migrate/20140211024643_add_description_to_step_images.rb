class AddDescriptionToStepImages < ActiveRecord::Migration
  def change
    add_column :step_images, :description, :string
  end
end
