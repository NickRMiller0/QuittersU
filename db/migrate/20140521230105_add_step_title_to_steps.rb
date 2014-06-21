class AddStepTitleToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :step_title, :string
  end
end
