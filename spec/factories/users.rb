FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'テスト'}
    first_name            {'テスト'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birthday              {'2000-01-01'}
  end
end