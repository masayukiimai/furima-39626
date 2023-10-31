class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
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
    
  
def show
  @item = Item.find(params[:id])
  @is_sold_out = @item.sold_out?
end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  
  
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id,  :shipping_fee_id, :region_id, :shipping_time_id).merge(user: current_user)
  end


  def move_to_index
  redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end
end



  


   
