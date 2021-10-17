class AddFromAddressIdToShipping < ActiveRecord::Migration[6.1]
  def change
    add_column :shippings, :from_address_id, :integer
    add_index :shippings, :from_address_id
  end
end
