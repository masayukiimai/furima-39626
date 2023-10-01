FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    nickname { "TestUser" }
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    birthday { "2000-01-01" }
    # 他の属性も必要に応じて追加してください
  end
end
