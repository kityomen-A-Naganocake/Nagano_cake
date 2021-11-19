class Admin::ItemsController < ApplicationController
    
    def index
        @admin_items = Item.all
    end
    
    def new
        @admin_item = Item.new
        @genres = Genre.all
    end
    
    def create
        item = Item.new(item_params)
        if item.update
            redirect_to admin_item(item.id)
        else
            @admin_item = Item.
            @genres = Genre.all
            render new_admin_item
        end
    end
    
    def show
    end
    
    def edit 
    end
    
    def update
    end
    
    
    private
    
    def item_params
        params.require(:list).permit(:name, :price_no_tax, :description, :is_active, :genre, :image)
    end
    
end
