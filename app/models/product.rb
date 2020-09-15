class Product < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_one :order

  validates :description, :title, :category, :min_price, :location, presence: true
  validates :username, uniqueness: true

  has_many_attached :photos
end
