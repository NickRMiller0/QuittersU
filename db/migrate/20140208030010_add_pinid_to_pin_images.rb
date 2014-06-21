class AddPinidToPinImages < ActiveRecord::Migration
  def change
    add_column :pin_images, :pin_id, :integer
    add_index :pin_images, :pin_id
  end
end
