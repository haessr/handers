class CreateNpos < ActiveRecord::Migration[6.0]
  def change
    create_table :npos do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
