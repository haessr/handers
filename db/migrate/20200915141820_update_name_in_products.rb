class UpdateNameInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :name, :title
  end
end
