class GalleryPhoto < ApplicationRecord
  has_one_attached :image
end
