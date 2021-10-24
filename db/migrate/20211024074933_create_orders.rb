class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :weight
      t.string :order_number
      t.string :product_name
      t.integer :count
      t.integer :price
      t.integer :hs_code
      t.references :shipping, null: false, foreign_key: true

      t.timestamps
    end
  end
end
