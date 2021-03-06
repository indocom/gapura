# frozen_string_literal: true

class ChangeTicketingSystemDesigns < ActiveRecord::Migration[5.2] # rubocop:todo Metrics/MethodLength
  def change
    add_column :transactions, :name, :string, null: false, default: ''
    add_index :transactions, %i[booking_reference ticket_type], unique: true

    remove_column :customers, :claim_token
    remove_column :customers, :last_confirmation_email

    add_column :tickets, :name, :string, null: false, default: ''
    add_column :tickets, :claim_token, :string, null: false, default: ''
    add_index :tickets, :claim_token, unique: true
    add_column :tickets, :quantity, :integer, null: false
    add_column :tickets, :last_confirmation_email, :datetime
    remove_column :tickets, :claimed_at
    remove_column :tickets, :claimed_by
    add_index :tickets, %i[booking_reference ticket_type], unique: true
  end
end
