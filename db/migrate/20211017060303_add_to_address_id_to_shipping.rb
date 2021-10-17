class AddToAddressIdToShipping < ActiveRecord::Migration[6.1]
  def change
    add_column :shippings, :to_address_id, :integer
    add_index :shippings, :to_address_id
  end
end
