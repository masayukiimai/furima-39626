FactoryBot.define do
 
    factory :user do
      email { Faker::Internet.unique.email } 
      password { "password123" }
      password_confirmation { "password123" }
      nickname { Faker::Name.name } 
      last_name { '山田' }
      first_name { '太郎' }
      last_name_kana { "ヤマダ" } 
      first_name_kana { "タロウ" } 
      birthday { Faker::Date.birthday(min_age: 18, max_age: 65) } 
    end
  end
  