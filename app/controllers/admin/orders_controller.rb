class Admin::OrdersController < ApplicationController
     before_action :baria_admin

        
    def index
        @orders = Order.all.page(params[:page]).per(10)
    end

    def show
        @order = Order.find(params[:id])
        
        @carts = OrderDetail.where(order_id: params[:id])
    end
    
    def update
        
    end
    
    def baria_admin
        unless admin_signed_in?
        redirect_to new_admin_session_path
        end
    end

end
