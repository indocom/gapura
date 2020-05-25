# frozen_string_literal: true

class Subscriber < ApplicationRecord
  before_create :generate_random_id

  belongs_to :customer
  validates :customer, uniqueness: true

  private

  def generate_random_id
    self.unsubscribe_code = SecureRandom.uuid
  end
end
