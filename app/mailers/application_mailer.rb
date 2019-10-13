class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def ticket_confirmation
    @customer = params[:customer]
    @total_tickets = params[:total_tickets]

    claim_url = claim_ticket_url(claim_token: @customer.claim_token)
    attachments.inline['QRCode.png'] = RQRCode::QRCode.new(claim_url).as_png.to_s

    mail(to: @customer.email, subject: 'NUANSA Ticket QR Code')
  end
end
