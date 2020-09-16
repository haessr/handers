class Adddefaultvaluestatus < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :status, :string, null: false, default: "pending"
  end
end
