class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @item = Item.new
  end
  

    
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path 
      else
        render :new
      end
    end
  
    def index
      @items = Item.order(created_at: :desc).all
    end
    
  
  
  
  
  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id,  :shipping_fee_id, :region_id, :shipping_time_id).merge(user: current_user)
  end
end





  


   
