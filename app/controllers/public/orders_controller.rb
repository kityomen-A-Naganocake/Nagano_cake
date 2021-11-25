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
        #address_number と定義した1～3の番号でif文を作成
        if params[:order][:address_number] == "1"
            # ここにはカレントカスタマーの住所が飛んできます
            @order.shipping_address = current_customer.address
            @order.zip_code = current_customer.zip_code
            @order.shipping_name = current_customer.first_name + current_customer.last_name
        elsif params[:order][:address_number] == "2"
            # ここには選択した住所のIDが飛んできます
            @shipping_address = ShippingAddress.find(params[:order][:address_id].to_i)
            @order.zip_code = @shipping_address.zip_code
            @order.shipping_address = @shipping_address.address
            @order.shipping_name = @shipping_address.recipients_name
        else
            # フォームで入力した住所が飛んできます
            # １フォームから入力したデータをパラムスでどう受け取るかを確認する
            # ２＠オーダーのデーターにフォームのデーターを代入する
            @order.shipping_address = params[:order][:address]
            @order.zip_code = params[:order][:zip_code]
            @order.shipping_name = params[:order][:full_name]
            # ここで新規アドレスを保存
            @new_address = ShippingAddress.new
            @new_address.address = params[:order][:address]
            @new_address.zip_code = params[:order][:zip_code]
            @new_address.recipients_name = params[:order][:full_name]
            @new_address.customer_id = current_customer.id
            @new_address.save
        end
        # 金額表示
        @cart_item_total_price = 0
    end

    def complete
       # @item = current_customer.cart_items
       # @item.destroy_all
        current_customer.cart_items.destroy_all
        #cart_items.destroy_all
    end

    # 購入を確定します
    def create # Order に情報を保存します
       cart_items = current_customer.cart_items.all
    # ログインユーザーのカートアイテムをすべて取り出して order_detail に入れます
        @order = current_customer.orders.new(order_params)
    # 渡ってきた値を @order に入れます
        if @order.save
    # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
            cart_items.each do |cart|
            # 取り出したカートアイテムの数繰り返します
             #order_detail にも一緒にデータを保存する必要があるのでここで保存します
                order_detail = OrderDetail.new
                order_detail.item_id = cart.item_id
                order_detail.order_id = @order.id
                order_detail.quantity = cart.quantity
            # 購入が完了したらカート情報は削除するのでこちらに保存します
                order_detail.price = cart.item.price_no_tax
            # カート情報を削除するので item との紐付けが切れる前に保存します
                order_detail.save
            end
            # ユーザーに関連するカートのデータ(購入したデータ)が保存されているので
            # complete画面に行ったらカート商品が削除される
            cart_items.destroy_all
            redirect_to orders_complete_path
        else
            @order = Order.new(order_params)
            render :new
        end
    end
    private
    def order_params
        params.require(:order).permit(:payment_method,:customer_id,:zip_code,:shipping_name,:shipping_address,:item_id,:payment_amount,:shipping_cost,:status)
    end
end