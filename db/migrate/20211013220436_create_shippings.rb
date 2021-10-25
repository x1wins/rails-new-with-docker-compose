class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|

      t.timestamps
    end
  end
end
