class Public::AddressesController < ApplicationController
     
     def index
          @shipping_address = ShippingAddress.new
          @shipping_addresses = ShippingAddress.all
          
     end
     
     def edit
     end
     
     def create
          @shipping_address = ShippingAddress.new(shipping_address_params)
          @shipping_address.customer_id = current_customer.id
          @shipping_address.save
          redirect_to addresses_path

     end
     
     def update
     end
     
     def destroy
     end
     
     private

     def shipping_address_params
     params.require(:shipping_address).permit(:zip_code, :address, :recipients_name)
     end

end
