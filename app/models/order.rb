class Order < ApplicationRecord
  validates :status, inclusion: { in: ["pending", "completed", "cancelled"]}
  belongs_to :product
  belongs_to :user
end
