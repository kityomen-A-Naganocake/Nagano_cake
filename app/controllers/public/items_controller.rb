class Public::ItemsController < ApplicationController

 def index
     #kaminariで8件表示
     @items = Item.all.page(params[:page]).per(8)
 end
 
 def show
     @items = Item.all
     @item = Item.find(params[:id])
     @cart_item = CartItem.new
 end

end
