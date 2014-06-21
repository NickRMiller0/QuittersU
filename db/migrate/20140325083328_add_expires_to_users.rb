class AddExpiresToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expires, :string
  end
end
