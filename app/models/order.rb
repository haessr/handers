class Order < ApplicationRecord
  validates :status, inclusion: { in: ["pending", "completed", "cancelled"]}
  validates :price, presence: true
  belongs_to :npo
  belongs_to :product
  belongs_to :user
  monetize :price_cents

  after_create :notify_seller
  before_save :mark_product_as_sold, if: :will_save_change_to_status?

  validate :price_should_be_greater_than_product_min_price
  # before_create :validate_price


  acts_as_notifiable :users,
    targets: ->(order, key) {
      [order.product.user]
    },
  notifiable_path: :order_notifiable_path

  def order_notifiable_path
    order_path(order)
  end

  def price_should_be_greater_than_product_min_price
    if self.price < self.product.min_price
      errors.add(:price, "should be greater than the min price")
    end
  end

  def notify_seller
    self.notify :users, key: "order.received"
  end

  def mark_product_as_sold
    if self.status == "completed"
      self.product.update(sold: true)
    end
  end
end
