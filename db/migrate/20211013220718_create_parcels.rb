class CreateParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :parcels do |t|
      t.integer :box_count
      t.string :memo
      t.integer :status
      t.references :shipping, null: false, foreign_key: true

      t.timestamps
    end
  end
end
