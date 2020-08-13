class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :explanation,         null: false
      t.integer :category,         null: false
      t.integer :status,           null: false
      t.integer :shippingorigin,   null: false
      t.integer :burden,           null: false
      t.integer :days,             null: false
      t.integer :price,            null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
