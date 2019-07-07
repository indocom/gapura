class GalleryPhoto < ApplicationRecord
  has_one_attached :image
  belongs_to :event, foreign_key: :year, primary_key: :year, touch: true

  validate :image_validation

  def image_validation
    if image.attached?
      if image.blob.byte_size > 2097152
        image.purge
        errors[:base] << 'Image too big (max 2 MB)'
      end
    elsif (image_link.blank?)
        errors[:base] << 'Image is missing'
    end
  end
end
