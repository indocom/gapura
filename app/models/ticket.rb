class Ticket < ApplicationRecord
  has_secure_token :claim_token

  belongs_to :customer, inverse_of: :tickets

  has_many :claim_histories, dependent: :destroy, inverse_of: :ticket

  def total_claimed
    return claim_histories.sum("claim_quantity")
  end

  def total_unclaimed
    return quantity - total_claimed
  end

  def send_confirmation_email
    ApplicationMailer.with(customer: customer, total_tickets: customer.tickets.count)
        .ticket_confirmation.deliver_later
    customer.last_confirmation_email = DateTime.now
    customer.save
  end
end
