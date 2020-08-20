class ItemShipping
  include ActiveModel::Model
  attr_accessor :postcode, :shippingorigin_id, :city, :number, :building, :telephonenumber, :user_id, :item_id, :purchase_id

  with_options presence: true do
    POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates :postcode, format: { with: POSTCODE_REGEX, message: 'is invalid. Postal code Input correctly' }
    validates :city
    validates :number
    TEL_REGEX = /\A\d{11}\z/.freeze
    validates :telephonenumber, format: { with: TEL_REGEX }
    validates :item_id
    validates :user_id
  end
  validates :shippingorigin_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, shippingorigin_id: shippingorigin_id, city: city, number: number, building: building, telephonenumber: telephonenumber, purchase_id: purchase.id, item_id: item_id)
  end
end
