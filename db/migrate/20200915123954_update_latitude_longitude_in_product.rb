class UpdateLatitudeLongitudeInProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :lat, :float
    remove_column :products, :long, :float
  end
end
