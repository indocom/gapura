# frozen_string_literal: true

class Sponsor < ApplicationRecord
  self.inheritance_column = 'inheritance_type'

  has_one :logo, as: :imageable, dependent: :destroy, class_name: 'Image'
  belongs_to :event, foreign_key: :year, primary_key: :year

  accepts_nested_attributes_for :logo,
                                reject_if: :all_blank, allow_destroy: true

  validates :type, :name, presence: true
end
