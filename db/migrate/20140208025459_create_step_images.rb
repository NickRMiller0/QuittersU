class CreateStepImages < ActiveRecord::Migration
  def change
    create_table :step_images do |t|

      t.timestamps
    end
  end
end
