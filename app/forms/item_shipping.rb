class ItemShipping

  include ActiveModel::Model
  attr_accessor :postcode, :shippingorigin_id, :city, :number, :building, :telephonenumber, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Postal code Input correctly" }
    validates :shippingorigin_id
    validates :city
    validates :number
    validates :telephonenumber
    validates :item_id
    validates :user_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, shippingorigin_id: shippingorigin_id, city: city, number: number, building: building, telephonenumber: telephonenumber, purchase_id: purchase.id, item_id: item_id)
  end
end