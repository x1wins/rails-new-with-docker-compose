class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :owner_name
      t.string :ssn
      t.string :phone1
      t.string :phone2
      t.string :zipcode
      t.string :address1
      t.string :address2
      t.references :shipping, null: false, foreign_key: true

      t.timestamps
    end
  end
end
