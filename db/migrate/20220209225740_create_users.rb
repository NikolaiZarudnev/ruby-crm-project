class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.boolean :is_admin
      t.boolean :is_supplier
      t.boolean :is_operator
      t.boolean :is_customer
      t.timestamps
    end
  end
end
