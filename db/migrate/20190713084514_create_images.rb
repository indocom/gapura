class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.binary :data, null: false
      t.string :mime_type
      t.string :filename
    end
  end
end
