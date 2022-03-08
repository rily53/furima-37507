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
  end
end
