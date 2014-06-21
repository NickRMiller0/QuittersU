class CreatePinImages < ActiveRecord::Migration
  def change
    create_table :pin_images do |t|
      t.string :description

      t.timestamps
    end
  end
end
