class CreatePastEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :past_events do |t|
      t.string :title,      null: false, default: ""
      t.string :subtitle
      t.text :description
      t.integer :year,      null: false, default: ""

      t.timestamps
    end
    add_index :past_events, :title,           unique: true
    add_index :past_events, :year,            unique: true
  end
end
