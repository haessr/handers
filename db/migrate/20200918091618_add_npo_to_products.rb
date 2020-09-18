class AddNpoToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :npo, :string
  end
end
