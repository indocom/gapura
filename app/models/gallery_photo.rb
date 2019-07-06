class GalleryPhoto < ApplicationRecord
  has_one_attached :image
  belongs_to :event, foreign_key: :year, primary_key: :year, touch: true

  def create(attributes = nil, &block)
    gallery_photo = super
    if gallery_photo.image.attached?
      gallery_photo.image_link = url_for(gallery_photo)
    end
    return gallery_photo
  end
end
