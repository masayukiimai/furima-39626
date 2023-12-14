class ShippingAddress < ApplicationRecord
  class ShippingAddress < ApplicationRecord
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  
    validates :region_id, presence: true, numericality: { other_than: 0 }
  
    validates :city, presence: true
  
    validates :address, presence: true
  
  
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  end
  
end
