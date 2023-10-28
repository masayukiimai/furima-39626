class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @item = Item.new
    @item.errors.add(:base, flash[:errors]) if flash[:errors].present?
  end
  

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path 
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to new_item_path
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :category_id, :condition_id,  :shipping_fee_id, :region_id, :shipping_time_id).merge(user: current_user)
  end
end





  


   
