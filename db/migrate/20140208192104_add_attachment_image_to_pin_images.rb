class AddAttachmentImageToPinImages < ActiveRecord::Migration
  def self.up
    change_table :pin_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :pin_images, :image
  end
end
