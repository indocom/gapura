class Ticket < ApplicationRecord
  belongs_to :customer, inverse_of: :tickets
  after_create :send_confirmation_email

  def claimed?
    return !claimed_at.nil?
  end

  private
    def send_confirmation_email
      ApplicationMailer.with(customer: customer).ticket_confirmation.deliver_later
      customer.last_confirmation_email = DateTime.now
      customer.save
    end
end
