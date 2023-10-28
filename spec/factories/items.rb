
FactoryBot.define do
  factory :item do
    name { "Sample Item" }
    description { "This is a sample item." }
    price { 1000 }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    region_id { 2 }
    shipping_time_id { 2 }
    association :user

    after(:build) do |item|
      # テスト用の画像ファイルの存在を確認
      file_path = Rails.root.join('public', 'images', 'test_image.png')
      if File.exist?(file_path)
        item.image.attach(io: File.open(file_path), filename: 'test_image.png', content_type: 'image/png')
      else
        raise "Test image not found at #{file_path}"
      end
    end
  end
end
