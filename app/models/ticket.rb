class Ticket < ApplicationRecord
  belongs_to :customer, inverse_of: :tickets

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
