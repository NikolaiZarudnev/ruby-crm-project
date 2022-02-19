class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :sales, :boolean
    add_column :users, :operator, :boolean
    add_column :users, :customer, :boolean
  end
end
