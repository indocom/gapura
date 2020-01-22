# frozen_string_literal: true

class CreateEventPreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :event_previews do |t|
      t.string :image_link
      t.integer :year, null: false
      t.foreign_key :events, column: :year, primary_key: 'year'

      t.timestamps
    end
    add_index :event_previews, :year
  end
end
