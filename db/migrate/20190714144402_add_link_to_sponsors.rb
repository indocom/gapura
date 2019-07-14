class AddLinkToSponsors < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsors, :link, :string, null: false, default: ""
  end
end
