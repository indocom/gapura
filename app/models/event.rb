class Event < ApplicationRecord
  has_one_attached :logo
  has_one :event_info, dependent: :destroy, foreign_key: 'year'
end
