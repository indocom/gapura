class Testimony < ApplicationRecord
  has_one_attached :photo

  validate :photo_validation

  validates :name, :profession, :testimony, presence: true


  def photo_validation
    if photo.attached?
      if photo.blob.byte_size > 2097152
        photo.purge
        errors[:base] << 'Tetimony photo too big'
      end
    end
  end
end
