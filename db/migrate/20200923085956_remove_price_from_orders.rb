class RemovePriceFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :price
  end
end
