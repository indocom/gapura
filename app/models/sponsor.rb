class Sponsor < ApplicationRecord
  self.inheritance_column='inheritance_type'

  has_one :logo, as: :imageable, dependent: :destroy, class_name: "Image"
  belongs_to  :event, foreign_key: :year, primary_key: :year

  accepts_nested_attributes_for :logo, reject_if: :all_blank, allow_destroy: true

#  validate :logo_validation

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
