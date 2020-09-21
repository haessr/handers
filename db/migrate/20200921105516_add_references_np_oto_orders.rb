class AddReferencesNpOtoOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :npo
    add_reference :orders, :npo

  end
end
