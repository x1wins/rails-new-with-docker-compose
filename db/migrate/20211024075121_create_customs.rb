class CreateCustoms < ActiveRecord::Migration[6.1]
  def change
    create_table :customs do |t|
      t.integer :customs_type
      t.integer :recipient_type
      t.references :shipping, null: false, foreign_key: true

      t.timestamps
    end
  end
end
