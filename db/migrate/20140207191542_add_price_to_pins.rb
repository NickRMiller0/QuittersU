class AddPriceToPins < ActiveRecord::Migration
  def change
    add_column :pins, :cost, :float
  end
end
