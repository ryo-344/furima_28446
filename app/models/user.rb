class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
  validates :lastnamekana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: "Full-width katakana characters" } 
  validates :firstnamekana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: "Full-width katakana characters" }
  validates :birthday, presence: true
end
