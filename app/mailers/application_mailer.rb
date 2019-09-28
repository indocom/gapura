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

	def blast_email
		@body = params[:body]

		subscribers = get_subscribers(params[:is_marketing_email])

		mail(to: generate_email_array(subscribers), 
			subject: params[:subject])

	end

	# Helper function that returns an array of subscribers
	def get_subscribers(is_marketing_email)
		if is_marketing_email == '1'
			target_subscribers = Subscriber.where(receive_marketing_email: true)
		else
			target_subscribers = Subscriber.all
		end

		return target_subscribers
	end

	# Returns an array of the emails of subscribers in a given array
	def generate_email_array(target_subscribers)
		email_array = []
		target_subscribers.each do |subscriber|
			email_array.push(subscriber.email)
		end

		return email_array
	end
end
