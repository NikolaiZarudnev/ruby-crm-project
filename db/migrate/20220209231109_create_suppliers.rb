class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :company
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
