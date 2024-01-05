class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_idd, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    ActiveRecord::Base.transaction do
      order = Order.create(user_id: user_id, item_id: item_id)
      ShippingAddress.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end
