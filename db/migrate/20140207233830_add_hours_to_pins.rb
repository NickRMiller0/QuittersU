class AddHoursToPins < ActiveRecord::Migration
  def change
    add_column :pins, :hours, :integer
  end
end
