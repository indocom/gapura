class ApplicationMailerPreview < ActionMailer::Preview
  def ticket_confirmation
    ApplicationMailer.with(customer: Customer.first, total_tickets: 5).ticket_confirmation
  end
end
