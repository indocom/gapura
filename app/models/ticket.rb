# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_secure_token :claim_token

  belongs_to :customer, inverse_of: :tickets

  has_many :claim_histories, dependent: :destroy, inverse_of: :ticket

  before_validation :titleize_name

  def total_claimed
    claim_histories.sum('claim_quantity')
  end

  def total_unclaimed
    quantity - total_claimed
  end

  def send_confirmation_email
    ApplicationMailer.with(ticket: self).ticket_confirmation.deliver_now
    self.last_confirmation_email = DateTime.now
    save
  end

  private

  def titleize_name
    self.name = name.titleize
  end
end
