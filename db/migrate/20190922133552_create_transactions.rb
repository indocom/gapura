class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :created_at, null: false
      t.datetime :purchased_at, null: false
      t.string :ticket_type, null: false, default: ""
      t.string :booking_reference, null: false, default: ""
    end
  end
end
