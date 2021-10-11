class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :logo
      t.boolean :lockable

      t.timestamps
    end
  end
end
