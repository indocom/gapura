class Admin::SubscribersController < ApplicationController
	def index
		@subscribers = Subscriber.all
	end

	def write_email

	end

	# Receive POST request from the form, and sends the email with the
	# POST parameters.
	def send_email
		ApplicationMailer.with(is_marketing_email: params[:is_marketing_email],
			subject: params[:subject], body: params[:body]).blast_email.deliver_now

		redirect_to admin_confirm_email_sent_path
	end

	# Displays some text to let the user know that the email has been successfully
	# sent.
	def confirm_email_sent

	end

end