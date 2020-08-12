FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname              { '阿部' }
    firstname             { '太朗' }
    lastnamekana          { 'アベ' }
    firstnamekana         { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
