class Chatroom < ApplicationRecord
  belongs_to :product
  # belongs_to :user
  belongs_to :buyer, :foreign_key => :user_id, :class_name => "User"
  has_many :messages
end
