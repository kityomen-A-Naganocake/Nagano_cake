class Public::CartItemsController < ApplicationController
    
    before_action :baria_cart
    

    def index
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @cart_item_total_price = 0
    end

    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end

    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end

    def destroy_all
        current_customer.cart_items.destroy_all
        redirect_to cart_items_path
    end

    def create
        cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
        if cart_item
            quantity = cart_item.quantity.to_i + params[:cart_item][:quantity].to_i
            cart_item.update(quantity: quantity)
            redirect_to cart_items_path
        else
            cart_item = CartItem.new(cart_item_params)
            cart_item.save
            redirect_to cart_items_path
        end
    end


    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
    end
    
    def baria_cart
        unless customer_signed_in?
            redirect_to root_path
        end
    end
    


end
