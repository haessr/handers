class Product < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_one :order

  validates :description, :title, :npo, :min_price, :location, presence: true

  has_many_attached :photos
end
