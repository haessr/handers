class Order < ApplicationRecord
  validates :status, inclusion: { in: ["pending", "completed", "cancelled"]}
  validates :npo, :price, presence: true

  belongs_to :product
  belongs_to :user
  after_create :notify_seller



  acts_as_notifiable :users,
    targets: ->(order, key) {
      [order.product.user]
    },
  notifiable_path: :order_notifiable_path

  def order_notifiable_path
    order_path(order)
  end

  def notify_seller
    self.notify :users, key: "order.received"
  end

end
