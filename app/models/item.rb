class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shippingorigin
  belongs_to_active_hash :burden
  belongs_to_active_hash :days
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true , inclusion: {in: 2..11}
  validates :status_id, presence: true, inclusion: {in: 2..7}
  validates :shippingorigin_id, presence: true, inclusion: {in: 2..48}
  validates :burden_id, presence: true, inclusion: {in: 2..3}
  validates :days_id, presence: true, inclusion: {in: 2..4}
  validates :price, presence: true, inclusion: {in: 300..9999999}

end
