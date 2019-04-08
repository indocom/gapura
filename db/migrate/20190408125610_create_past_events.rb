class CreatePastEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :past_events do |t|

      t.timestamps
    end
  end
end
