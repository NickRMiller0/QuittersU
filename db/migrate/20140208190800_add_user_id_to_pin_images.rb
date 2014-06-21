class AddUserIdToPinImages < ActiveRecord::Migration
  def change
    add_column :pin_images, :user_id, :integer
    add_index :pin_images, :user_id
  end
end
