class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_sponsors do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.integer :year, null: false
      t.foreign_key :events, column: :year, primary_key: "year"

      t.timestamps
    end

    add_index :admin_sponsors, :year
  end
end
