class RemovePriceToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :min_price
  end
end
