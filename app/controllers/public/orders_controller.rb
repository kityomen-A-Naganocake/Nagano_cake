class Public::OrdersController < ApplicationController

    def index
    end
    
    def show
    end
    
    def new
        #@shipping_addresses = ShippingAddress.where(customer: current_customer)
        #@sipping_addre = Sippingaddress.new
        @order = Order.new
        
        #@orders = current_customer.orders.all
        @customer = Customer.find(current_customer.id)
        @shipping_addresses = @customer.shipping_addresses
    end
    
    def confirm
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    
    def complete
    end
    
    def create
        @item = Item.find(params[:item_id])
        @order = @item.order.new(order_params)
        @order.save
        redirect_to items_path
    end
    
    
    private
    
    def order_params
        params.require(:order).permit(:customer_id,:zip_code,:sipping_address,:addressitem_id,:payment_amount,:shipping_cost,:status)
    end
    # もしかしたらshipping_addresses_paramsかも
    def shipping_addresses_params
        params.require(:order).permit(:customer_id,:last_name,:first_name,:zip_code,:address)
    end
    # 商品合計（税込）の計算
    #def calculate(user)
     #   total_price = 0
     #   user.cart_items.each do |cart_item|
     #      payment_amount += cart_item.quantity * cart_item.item.price
     #   end
     #   return (total_price * 1.1).floor
    #end
end
