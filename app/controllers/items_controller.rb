
    class ItemsController < ApplicationController
      
      def new
        @item = Item.new
      end
      
      def create
        @item = current_user.items.build(item_params)
        if @item.save
          redirect_to root_path
        else
          render :new
        end
      end
      before_action :authenticate_user!, only: [:new, :create]

      private
      
      def item_params
        params.require(:item).permit(:name, :description, :price, :image, )
      end
    end      
    
  

