# frozen_string_literal: true

class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.references :customer, foreign_key: true
      t.boolean :unsubscribed, default: false
      t.string :unsubscribe_code

      t.timestamps
    end
  end
end
