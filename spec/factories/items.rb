FactoryBot.define do
  factory :item do
    name             { 'テスト商品' }
    description      { 'テスト商品の説明' }
    price            { 1000 }
    category_id      { 2 }
    status_id        { 2 }
    shipping_cost_id   { 2 }
    prefecture_id    { 2 }
    shipping_day_id  { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
