class CreateLastTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :last_transactions, id: false do |t|
      t.datetime :time, null: false
    end

    LastTransaction.create(time: DateTime.new(0))
  end
end
