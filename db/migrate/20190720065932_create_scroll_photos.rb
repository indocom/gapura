class CreateScrollPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :scroll_photos do |t|
      t.string :image_link
      t.integer :year
      t.datetime :created_at

      t.timestamps
    end
  end
end
