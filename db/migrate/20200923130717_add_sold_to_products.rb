class AddSoldToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sold, :boolean, default: false, nil: false
  end
end
