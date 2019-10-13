class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def ticket_confirmation
    @ticket = params[:ticket]
    claim_url = claim_ticket_url(claim_token: @ticket.claim_token)

    attachments.inline['QRCode.png'] = RQRCode::QRCode.new(claim_url).as_png.to_s

    mail(to: @ticket.customer.email, subject: 'NUANSA Ticket QR Code')
  end
end
