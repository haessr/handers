class Product < ApplicationRecord
  geocoded_by :location
  monetize :min_price_cents

  belongs_to :user
  belongs_to :npo

  has_many :chatrooms
  has_many :orders
  has_many_attached :photos

  has_one :review

  validates :description, :title, :min_price_cents, :location, presence: true
  validates :photos, presence: true

  after_validation :geocode, if: :will_save_change_to_location?
end
