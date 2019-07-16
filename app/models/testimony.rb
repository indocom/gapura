class Testimony < ApplicationRecord
  has_one :photo, as: :imageable, dependent: :destroy, class_name: "Image"
  accepts_nested_attributes_for :photo, reject_if: :all_blank, allow_destroy: true

  validates :name, :profession, :testimony, presence: true
end
