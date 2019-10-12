class Ticket < ApplicationRecord
  has_secure_token :claim_token

  belongs_to :customer, inverse_of: :tickets

  has_many :claim_histories, dependent: :destroy, inverse_of: :ticket

  def claimed?
    return !claimed_at.nil?
  end

  def send_confirmation_email
    ApplicationMailer.with(customer: customer, total_tickets: customer.tickets.count)
        .ticket_confirmation.deliver_later
    customer.last_confirmation_email = DateTime.now
    customer.save
  end
end
