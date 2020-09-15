class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_products, foreign_key: "user_id" , class_name: "Product"

  has_many :orders

  has_many :bought_products, source: :product, through: :orders

  validates :username, uniqueness: true

  has_one_attached :avatar
end
