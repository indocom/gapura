class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, touch: true
end
