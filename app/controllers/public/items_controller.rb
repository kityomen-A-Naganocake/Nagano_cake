class Public::ItemsController < ApplicationController

 def index
     #kaminariで8件表示
     @items = Item.all.page(params[:page]).per(8)
     #@genres = Genres.all
 end
 
 def show
     @items = Item.all
     @item = Item.find(params[:id])
     #@genres = Genres.find(params[:id])
 end

end
