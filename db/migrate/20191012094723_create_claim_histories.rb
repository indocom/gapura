# frozen_string_literal: true

class CreateClaimHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :claim_histories do |t|
      t.references :ticket, foreign_key: true
      t.string :claimed_by, null: false
      t.datetime :claimed_at, null: false
      t.integer :claim_quantity, null: false
    end
  end
end
