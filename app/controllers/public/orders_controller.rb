class Public::OrdersController < ApplicationController

    def index
    end

    def show
    end

    def new
        @order = Order.new
        @addresses = current_customer.shipping_addresses
        @customer = Customer.find(current_customer.id)
        @shipping_addresses = @customer.shipping_addresses.all
    end

    def confirm
        @order = Order.new(order_params)
       
        @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
        @order.zip_code = current_customer.zip_code
        @order.shipping_address = current_customer.shipping_address
        @order.shipping_name = current_customer.first_name + current_customer.last_name
        @cart_item_total_price = 0
    end

    def complete
    end
    
    # 購入を確定します
    def create # Order に情報を保存します
      cart_items = current_customer.cart_items.all
    # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
      @order = current_customer.orders.new(order_params)
    # 渡ってきた値を @order に入れます
      if @order.save
    # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
        cart_items.each do |cart|
    # 取り出したカートアイテムの数繰り返します
    # order_item にも一緒にデータを保存する必要があるのでここで保存します
          order = Order.new
          order.item_id = cart.item_id
          order.order_id = @order.id
          order.order_quantity = cart.quantity
    # 購入が完了したらカート情報は削除するのでこちらに保存します
        #  order.order_price = cart.item.price
    # カート情報を削除するので item との紐付けが切れる前に保存します
          order.save
        end
        redirect_to orders_confirm_path
        cart_items.destroy_all
    # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
      else
        @order = Order.new(order_params)
        render :new
      end
    end
    #def create
        # session[:payment] = params[:payment]
        # if params[:select] == "select_address"
        #   session[:address] = params[:address]
        # elsif params[:select] == "my_address"
            # session[:address] ="〒" +current_customer.zip_code+current_customer.address+current_customer.last_name+current_customer.first_name
        # end
        # if session[:address].present? && session[:payment].present?
            # redirect_to orders_confirm_path
        # else
            # redirect_to new_order_path
        # end
    # end
    private

    def order_params
        params.require(:order).permit(:payment_method,:customer_id,:zip_code,:shipping_address,:item_id,:payment_amount,:shipping_cost,:status)
    end

end
