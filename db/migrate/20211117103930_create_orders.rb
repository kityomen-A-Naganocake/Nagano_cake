class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :zip_code, null: false
      t.string :sipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :shipping_cost, null: false
      t.integer :payment_amount, null: false
      t.integer :payment_method, null: false, default:  0
      t.integer :status, null: false, default:  0
      
      t.timestamps
    end
  end
end
