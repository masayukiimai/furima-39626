class User < ApplicationRecord
  validates :nickname, presence: true
validates :last_name, presence: true
validates :first_name, presence: true 
validates :last_name_kana, presence: true
validates :first_name_kana, presence: true
validates :birthday, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
          VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
          VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

          validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' }
          validates :last_name, format: { with: VALID_NAME_REGEX, message: 'は全角文字で入力してください' }
          validates :first_name, format: { with: VALID_NAME_REGEX, message: 'は全角文字で入力してください' }
          validates :last_name_kana, format: { with: VALID_KANA_REGEX, message: 'はカタカナで入力してください' }
          validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: 'はカタカナで入力してください' }
          
          has_many :items

end
