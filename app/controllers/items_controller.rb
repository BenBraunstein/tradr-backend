class ItemsController < ApplicationController

    def index 
        items = Item.all
        render json: items
    end

    def create 
        item = Item.create(strong_item_params)
        render json: item
    end

    private
    def strong_item_params
        params.require(:item).permit(:name, :image, :category, :user_id)
    end

end
