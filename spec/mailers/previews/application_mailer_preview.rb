class ApplicationMailerPreview < ActionMailer::Preview
  def ticket_confirmation
    ApplicationMailer.with(ticket: Ticket.second).ticket_confirmation
  end

  def mail_personal
  	ApplicationMailer.with(subscriber: Subscriber.second, 
  		subject: "Test Subject", body: "<b>Hi!</b>").mail_personal
  end
end
