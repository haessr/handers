class Npo < ApplicationRecord
  has_one_attached :photo

  has_many :products
  has_many :orders
end
