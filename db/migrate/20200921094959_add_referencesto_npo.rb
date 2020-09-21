class AddReferencestoNpo < ActiveRecord::Migration[6.0]
  def change
    add_reference :npos, :products
    add_reference :npos, :orders
  end
end
