class CreateSubscribers < ActiveRecord::Migration[5.2] 
  def change
    create_table :subscribers do |t|
      t.boolean :receive_marketing_email
      t.references :customer, foreign_key: true
      t.string :unsubscribe_code

      t.timestamps
    end
  end
end
