# frozen_string_literal: true

class AddPreviewInfoToEventPreview < ActiveRecord::Migration[5.2]
  def change
    add_column :event_previews, :preview_info, :text
  end
end
