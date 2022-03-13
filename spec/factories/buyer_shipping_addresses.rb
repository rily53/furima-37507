FactoryBot.define do
  factory :buyer_shipping_address do
    token               { 'tok_abcdefghijk00000000000000000' }
    post_code           { '123-1234' }
    area_id             { '2' }
    municipalities      { 'テスト' }
    address             { 'テスト' }
    building_name       { 'テスト' }
    phone               { '09012345678' }
  end
end
