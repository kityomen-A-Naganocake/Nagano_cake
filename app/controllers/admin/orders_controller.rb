class Admin::OrdersController < ApplicationController
     before_action :baria_admin

        
    def index
        @orders = Order.all.page(params[:page]).per(10)
    end

    def show
        @order = Order.find(params[:id])
        @carts = @order.order_details

        # @carts = OrderDetail.where(order_id: params[:id])
    end
    
    def update
        # 注文ステータスの変更
        @order = Order.find(params[:id])
        @order.update(order_params)
        # ↓イーナムの１だよ〜
        if @order.status == "confirmation_of_payment"
           @order.order_details.update_all(production_status: 1)
        end
        redirect_to admin_order_path(@order.id)



    end
    
    def baria_admin
        unless admin_signed_in?
        redirect_to new_admin_session_path
        end
    end

    private
	def order_params
		  params.require(:order).permit(:status, :customer_id, :shipping_address, :zip_code,
		  :shipping_name, :shipping_cost, :payment_amount, :payment_method)
	end

	
	
	    
	


end
