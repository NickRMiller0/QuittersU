class AddAttachmentStoreImageToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.attachment :store_image
    end
  end

  def self.down
    drop_attached_file :stores, :store_image
  end
end
