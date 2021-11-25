class Admin::OrdersController < ApplicationController

    def index
        @orders = Order.all.page(params[:page]).per(10)
    end

    def show
        @order = Order.find(params[:id])
        
        @carts = OrderDetail.where(order_id: params[:id])
    end
    
    def update
    end


end
