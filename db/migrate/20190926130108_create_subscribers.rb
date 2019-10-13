class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers, id: :uuid do |t|
      t.string :name
      t.string :email
      t.boolean :receive_marketing_email

      t.timestamps
    end
  end
end