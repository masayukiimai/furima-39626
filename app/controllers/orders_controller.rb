class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]

 

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  def index
    @purchase_form = PurchaseForm.new
  end
  
  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  def pay_item
    # PAY.JPを使用した決済処理をここに記述します
  end
end
