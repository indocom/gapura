class Event < ApplicationRecord
  has_one_attached :logo
  has_one :event_info, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event
  accepts_nested_attributes_for :event_info
  has_many :gallery_photos, dependent: :destroy, foreign_key: :year,
    primary_key: :year, inverse_of: :event
end
