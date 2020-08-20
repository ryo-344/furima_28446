class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postcode, null: false
      t.integer :shippingorigin_id, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :building
      t.string :telephonenumber, null: false
      t.integer :item_id, null: false, foreign_key: true
      t.integer :purchase_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
