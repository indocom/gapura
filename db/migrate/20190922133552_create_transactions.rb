class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :created_at, null: false
      t.datetime :purchased_at, null: false
      t.string :booking_reference, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :ticket_type, null: false, default: ""
      t.integer :quantity, null: false
    end
  end
end
