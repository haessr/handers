class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :min_price
      t.string :location
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
