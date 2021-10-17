class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :owner_name
      t.string :ssn
      t.string :phone1
      t.string :phone2
      t.string :zipcode
      t.string :address1
      t.string :address2

      t.timestamps
    end
  end
end
