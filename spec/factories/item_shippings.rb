FactoryBot.define do
  factory :item_shipping do
    postcode { '123-4567' }
    shippingorigin_id { 2 }
    city { '横浜' }
    number { '青山1-1' }
    telephonenumber { '09012345678' } 
    user_id { 1 }
    item_id { 1 }   
  end
end
