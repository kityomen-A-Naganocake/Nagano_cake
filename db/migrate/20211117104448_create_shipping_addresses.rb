class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.string :recipients_name, null: false
      
      t.timestamps
    end
  end
end
