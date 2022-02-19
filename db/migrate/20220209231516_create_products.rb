class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image
      t.boolean :hidden
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
