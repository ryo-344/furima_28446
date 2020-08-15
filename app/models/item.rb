class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shippingorigin
  belongs_to_active_hash :burden
  belongs_to_active_hash :days

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, inclusion: {in: 2..11}
    validates :status_id, inclusion: {in: 2..7}
    validates :shippingorigin_id, inclusion: {in: 2..48}
    validates :burden_id, inclusion: {in: 2..3}
    validates :days_id, inclusion: {in: 2..4}
    validates :price, inclusion: {in: 300..9999999}
  end
end
