class ApplicationMailerPreview < ActionMailer::Preview
  def ticket_confirmation
    ApplicationMailer.with(ticket: Ticket.second).ticket_confirmation
  end
end
