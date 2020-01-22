# frozen_string_literal: true

class CreateTestimonies < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonies do |t|
      t.string :name, null: false
      t.string :profession, null: false
      t.text :testimony, null: false

      t.timestamps
    end
  end
end
