class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_time
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999 
  }
  validates :category_id, presence: true, inclusion: { in: 0..11 }  # カテゴリーは0~11の範囲
  validates :condition_id, presence: true, inclusion: { in: 0..6 }  # 商品の状態は0~6の範囲
  validates :shipping_fee_id, presence: true, inclusion: { in: [0,1,2] }  # 配送料は0~2の範囲
  validates :region_id, presence: true, inclusion: { in: 0..48 }  # 48項目（---と47都道府県）
  validates :shipping_time_id, presence: true, inclusion: { in: 0..3 }  # 発送までの日数は0~3の範囲
  validates :category_id, :condition_id, :shipping_fee_id, :region_id, :shipping_time_id, numericality: { other_than: 0, message: 'must be selected' }

   def sold_out?
    sold_out
  end


  
end
