class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :is_supplier, :boolean
    add_column :users, :is_operator, :boolean
    add_column :users, :is_customer, :boolean
  end
end
