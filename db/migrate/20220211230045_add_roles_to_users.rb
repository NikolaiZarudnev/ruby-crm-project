class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.boolean :is_admin, null: false
      t.boolean :is_supplier, null: false
      t.boolean :is_operator, null: false
      t.boolean :is_customer, null: false
    end
  end
end
