class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.datetime :purchased_at, null: false
      t.datetime :claimed_at
      t.string :claimed_by
      t.references :customer, foreign_key: true
      t.string :note, null: false, default: ""
      t.string :receipt, null: false, default: ""
    end
  end
end
