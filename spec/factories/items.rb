FactoryBot.define do
  factory :item do
    name { Faker::Team.name }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    shippingorigin_id { 2 }
    burden_id { 2 }
    days_id { 2 }
    price { 500 }
    association :user
  end
end
