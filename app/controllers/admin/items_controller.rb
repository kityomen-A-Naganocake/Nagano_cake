class Admin::ItemsController < ApplicationController

    def index
        @admin_items = Item.all.page(params[:page]).per(8)
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
        @admin_item = Item.find(params[:id])
        @genres = Genre.all
    end

    def update
        item = Item.find(params[:id])
        if item.update(item_params)
            redirect_to admin_item_path(item)
        else
            @admin_item = Item.find(params[:id])
            @genres = Genre.all
            render edit
        end
    end


    private

    def item_params
        params.require(:item).permit(:name, :price_no_tax, :description, :is_active, :genre_id, :image)
    end

end
