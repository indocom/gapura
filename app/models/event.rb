class Event < ApplicationRecord
  has_one :logo, as: :imageable, dependent: :destroy, class_name: "Image"
  accepts_nested_attributes_for :logo, reject_if: :all_blank, allow_destroy: true

  has_one :event_info, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event
  accepts_nested_attributes_for :event_info

  has_many :sponsors, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event
  
  has_many :gallery_photos, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event

  validates :year, :title, :overview, presence: true
end
