class AddHeadingToPins < ActiveRecord::Migration
  def change
    add_column :pins, :pin_heading, :string
  end
end
