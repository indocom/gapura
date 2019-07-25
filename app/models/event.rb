class Event < ApplicationRecord
  has_one_attached :logo
  has_one :event_info, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event
  accepts_nested_attributes_for :event_info

  has_many :sponsors, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event
  
  has_many :gallery_photos, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event

  validate :logo_validation

  validates :year, :title, :overview, presence: true

  def logo_validation
    if logo.attached?
      if logo.blob.byte_size > 2097152
        logo.purge
        errors[:base] << 'Logo too big (max 2 MB)'
      end
    end
  end
end
