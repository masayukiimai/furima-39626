
    FactoryBot.define do
      factory :purchase_form do
        postal_code { '123-4567' }
        region_id { 1 }
        city { '東京都' }
        address { '渋谷1-1-1' }
        building { '渋谷ビル101' }
        phone_number { '09012345678' }
        token { 'tok_abcdefghijk00000000000000000' }
  
  end
end