class DeleteNpoAndPastReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :npos, :products_id
    remove_column :npos, :orders_id
    remove_column :orders, :npo
    remove_column :products, :npo

  end
end
