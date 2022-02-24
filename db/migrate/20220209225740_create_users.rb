class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.boolean :is_admin, null: false
      t.boolean :is_supplier, null: false
      t.boolean :is_operator, null: false
      t.boolean :is_customer, null: false
      t.timestamps
    end
  end
end
