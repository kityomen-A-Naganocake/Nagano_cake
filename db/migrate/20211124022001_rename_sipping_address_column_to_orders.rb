class RenameSippingAddressColumnToOrders < ActiveRecord::Migration[5.2]
  def change
        rename_column :orders, :sipping_address, :shipping_address
  end
end
