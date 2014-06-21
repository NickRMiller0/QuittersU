class AddPinIdToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :pin_id, :integer
    add_index :steps, :pin_id
  end
end
