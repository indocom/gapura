class DropColumnInSubscribers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :subscribers, :receive_important_email
  end
end
