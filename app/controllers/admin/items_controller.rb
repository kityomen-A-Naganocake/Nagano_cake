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
        if item.save
            redirect_to admin_item_path(item.id)
        else
            @admin_item = Item.new
            @genres = Genre.all
            render new_admin_item_path
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
    end

    def update
    end


    private

    def item_params
        params.require(:item).permit(:name, :price_no_tax, :description, :is_active, :genre_id, :image)
    end

end
