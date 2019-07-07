class CreateEventInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :event_info do |t|
      t.text :synopsis
      t.text :description
      t.string :video_link
      t.integer :year
      t.foreign_key :events, column: :year, primary_key: "year"
    end
    add_index :event_info, :year, unique: true
  end
end
