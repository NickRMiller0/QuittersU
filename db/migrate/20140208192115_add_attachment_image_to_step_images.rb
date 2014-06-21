class AddAttachmentImageToStepImages < ActiveRecord::Migration
  def self.up
    change_table :step_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :step_images, :image
  end
end
