class Public::AddressesController < ApplicationController
     
     def index
          @shipping_address = ShippingAddress.new
          @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
          
     end
     
     def edit
          @shipping_address = ShippingAddress.find(params[:id])
     end
     
     def create
          @shipping_address = ShippingAddress.new(shipping_address_params)
          @shipping_address.customer_id = current_customer.id
          @shipping_address.save
          redirect_to addresses_path

     end
     
     def update
          @shipping_address = ShippingAddress.find(params[:id])
          @shipping_address.update(shipping_address_params)
          redirect_to  addresses_path
          
     end
     
     def destroy
          @shipping_address  = ShippingAddress.find(params[:id])
          @shipping_address.destroy
          redirect_to addresses_path#destroyメソッドを使用し対象のツイートを削除する。
     end
     
     private

     def shipping_address_params
     params.require(:shipping_address).permit(:zip_code, :address, :recipients_name)
     end

end
