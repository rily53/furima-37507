FactoryBot.define do
  factory :item do
    item_name           { 'テスト' }
    explanation         { 'テスト' }
    category_id         { '2' }
    status_id           { '2' }
    shipping_charge_id  { '2' }
    area_id             { '2' }
    shipping_day_id     { '2' }
    price               { '300' }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
