class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title,      null: false, default: ""
      t.string :subtitle
      t.text :description
      t.integer :year,      null: false, default: ""

      t.timestamps
    end
    add_index :events, :title,           unique: true
    add_index :events, :year,            unique: true
  end
end
