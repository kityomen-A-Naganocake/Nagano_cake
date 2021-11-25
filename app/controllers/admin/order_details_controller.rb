class Admin::OrderDetailsController < ApplicationController

def update
 # 制作ステータスの変更
    @cart = OrderDetail.find(params[:id])
    @cart.update(order_detail_params)
    change_status(@cart)
    @order = @cart.order
    redirect_to admin_order_path(@order)
    
end




private
def order_detail_params
	params.require(:order_detail).permit(:production_status)
end

def change_status(cart)
    if cart.production_status == "in_production"
       cart.order.update(status: "in_production" )
    
    elsif cart.production_status == "complete_production"
          count = 0
          cart.order.order_details.each do |order_detail|
            if order_detail.production_status == "complete_production"
               count += 1
            end
          
    end
        if count == cart.order.order_details.count
        cart.order.update(status: "in_preparation_for_shipment" )
        end
    end
end
end