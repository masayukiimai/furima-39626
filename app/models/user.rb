class User < ApplicationRecord
  validates :nickname, presence: true
validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "is invalid. Input full-width characters." }
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "is invalid. Input full-width characters." }
validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
validates :birthday, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
