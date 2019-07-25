class Sponsor < ApplicationRecord
  self.inheritance_column='inheritance_type'

  has_one_attached :logo
  belongs_to  :event, foreign_key: :year, primary_key: :year

  validate :logo_validation

  validates :type, :name, presence: true

  def logo_validation
    if logo.attached?
      if logo.blob.byte_size > 2097152
        logo.purge
        errors[:base] << 'Sponsor logo too big (max 2 MB)'
      end
    end
  end
end
