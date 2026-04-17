FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { 'abc000' }
    password_confirmation { password }
    last_name             { '海原' }
    first_name            { '雄山' }
    last_name_kana        { 'カイバラ' }
    first_name_kana       { 'ユウザン' }
    birth_date            { '1990-01-01' }
  end
end
