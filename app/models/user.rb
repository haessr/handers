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
  
  acts_as_target
  # User.first.notifications.first.notifiable
  # has_many :owned_flats, foreign_key: "user_id" , class_name: "Flat"
  # has_many :booked_flats, source: :flat, through: :reservations
  # has_many :chatrooms
  has_many :chatrooms_as_seller, source: :chatrooms , through: :owned_products
  has_many :chatrooms_as_buyer, foreign_key: "user_id" , class_name: "Chatroom"
end
