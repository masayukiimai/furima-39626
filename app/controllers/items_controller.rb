
class ItemsController < ApplicationController
 

   before_action :set_item, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
   before_action :redirect_unless_owner, only: [:edit, :update,:destroy]
   before_action :redirect_if_sold, only: [:edit, :update]
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
end


   def edit
   end

   def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item)
    end
  end
  
  private
  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path, alert: "Item not found" if @item.nil?
  end
  def redirect_if_sold
    if @item.order.present?
      redirect_to root_path
    end
  end
  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id,  :shipping_fee_id, :region_id, :shipping_time_id).merge(user: current_user)
  end
end

def redirect_unless_owner
  redirect_to root_path unless current_user.id == @item.user_id
end
   







  


   



 
