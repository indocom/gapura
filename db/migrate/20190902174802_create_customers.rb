# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email, null: false, default: ''
      t.string :claim_token, null: false, default: ''
      t.datetime :last_confirmation_email
    end
    add_index :customers, :claim_token, unique: true
    add_index :customers, :email, unique: true
  end
end
