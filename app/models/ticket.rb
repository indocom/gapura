class Ticket < ApplicationRecord
  belongs_to :customer, inverse_of: :tickets

  def claimed?
    return !claimed_at.nil?
  end
end
