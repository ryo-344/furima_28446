class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  validates :nickname, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :lastname, presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' }
  validates :firstname, presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' }
  KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates :lastnamekana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
  validates :firstnamekana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
  validates :birthday, presence: true
end
