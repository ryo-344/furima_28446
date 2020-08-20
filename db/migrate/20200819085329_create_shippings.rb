class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.string :postcode, null: false
      t.integer :shippingorigin_id, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :building, null: false
      t.string :telephonenumber, null: false
      t.integer :item_id, null: false, foreign_key: true
      t.integer :purchase_id, null: false, foreign_key: true
    end
  end
end
