class AddPriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :products, :min_price, currency: { present: false }
  end
end
