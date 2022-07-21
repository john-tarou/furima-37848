FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    item_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '港区' }
    addresses { '新橋' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    item_id { 1 }
  end
end
