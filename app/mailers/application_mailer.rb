class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def ticket_confirmation
    @ticket = params[:ticket]
    claim_url = claim_ticket_url(claim_token: @ticket.claim_token)

    attachments.inline['QRCode.png'] = RQRCode::QRCode.new(claim_url).as_png.to_s

    mail(to: @ticket.customer.email, subject: 'NUANSA 2019: Lukisan Jati E-Ticket')
  end

	def ticket_confirmation
		@customer = params[:customer]
		@total_tickets = params[:total_tickets]

    claim_url = claim_ticket_url(claim_token: @customer.claim_token)
    attachments.inline['QRCode.png'] = RQRCode::QRCode.new(claim_url).as_png.to_s

    mail(to: @customer.email, subject: 'NUANSA Ticket QR Code')
  end

  def mail_personal
    @body = params[:body]
    @subscriber = params[:subscriber]

    mail(to: params[:subscriber].customer.email, subject: params[:subject])
  end
end