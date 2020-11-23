FactoryBot.define do
  factory :user do
    first_name             { '山田' }
    last_name              { '花子' }
    first_name_kana        { 'ヤマダ' }
    last_name_kana         { 'ハナコ' }
    birthday               { Faker::Date.birthday }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
  end
end
