class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_allowed, only: [:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index,status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    begin
      charge = Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
    rescue Payjp::InvalidRequestError => e
    end
  end
  def redirect_if_not_allowed
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    end
end
end