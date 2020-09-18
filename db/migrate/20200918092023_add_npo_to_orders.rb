class AddNpoToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :npo, :string
  end
end
