class ChangeTicketingSystemDesigns < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :name, :string, null: false, default: ""
    add_index :transactions, [:booking_reference, :ticket_type], unique: true

    remove_column :customers, :claim_token
    remove_column :customers, :last_confirmation_email
  end
end
