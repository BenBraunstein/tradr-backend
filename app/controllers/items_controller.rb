class ItemsController < ApplicationController

    def index 
        items = Item.all.order(:id)
        render json: items
    end

    def create 
        item = Item.create(strong_item_params)
        render json: item
    end

    def update 
        item = Item.find(params[:id])
        item.update(strong_item_params)
        render json: item
    end

    def destroy 
        item = Item.find(params[:id])
        item.destroy()
        render json: item
    end

    private
    def strong_item_params
        params.require(:item).permit(:name, :image, :category, :user_id)
    end

end
