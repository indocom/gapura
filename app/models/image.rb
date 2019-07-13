class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, touch: true
  attr_accessor :file

  before_validation :populate_fields_from_file

  private
    def populate_fields_from_file
      return if file.nil?
      self.data = file.read
      self.filename = file.original_filename
      self.mime_type = file.content_type
    end
end
