class AddUrlPhotoToNpo < ActiveRecord::Migration[6.0]
  def change
    add_column :npos, :url_photo, :string
  end
end
