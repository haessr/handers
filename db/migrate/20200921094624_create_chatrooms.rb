class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :title
      t.references :product, null: false, foreign_key: true
      t.references :buyer, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
