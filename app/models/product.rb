class Product < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :orders
  has_one :review
  belongs_to :npo


  validates :description, :title, :min_price_cents, :location, presence: true

  has_many_attached :photos
  has_many :chatrooms
  monetize :min_price_cents
end
