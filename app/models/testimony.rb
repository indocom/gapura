class Testimony < ApplicationRecord
  has_one :photo, as: :imageable, dependent: :destroy, class_name: "Image"
  accepts_nested_attributes_for :photo, reject_if: :all_blank, allow_destroy: true

#  validate :photo_validation

  validates :name, :profession, :testimony, presence: true

  def photo_validation
    if photo.attached?
      if photo.blob.byte_size > 2097152
        photo.purge
        errors[:base] << 'Tetimony photo too big (max 2 MB)'
      end
    end
  end
end
