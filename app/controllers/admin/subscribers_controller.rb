class Admin::SubscribersController < ApplicationController
	def index
		@subscribers = Subscriber.all
	end

	def write_email

	end

	# Receive POST request from the form, and sends the email with the
	# POST parameters.
	def send_email
		target_subscribers = get_subscribers(params[:is_marketing_email])
		email_list = generate_email_list(target_subscribers)

		RestClient.post "https://api:ca0f5f6975dbe58722c785c5935af894-baa55c84-fad6f895"\
  		"@api.mailgun.net/v3/sandboxc98bd9f154dd4e91a655b4cc5639a4fe.mailgun.org/messages",
  		:from => "Excited User <mailgun@sandboxc98bd9f154dd4e91a655b4cc5639a4fe.mailgun.org>",
  		:to => email_list,
  		:subject => params[:title],
  		:html => params[:body]

		redirect_to admin_confirm_email_sent_path
	end

	# Displays some text to let the user know that the email has been successfully
	# sent.
	def confirm_email_sent

	end

	# Helper function that returns an array of Subscribers under a specific subscription plan
	# (Whether they want marketing email or not).
	def get_subscribers(is_marketing_email)
		if is_marketing_email
			target_subscribers = Subscriber.where(receive_marketing_email: true)
		else
			target_subscribers = Subscriber.all
		end

		return target_subscribers
	end

	# Helper function that returns a string of comma-seperated list
	# of their emails, given an array of Subscribers.
	# Example: "jackjack@gmail.com, tommy@yahoo.com"
	def generate_email_list(target_subscribers)
		email_list = []
		target_subscribers.each do |subscriber|
			email_list.push(subscriber.email)
		end

		return email_list.join(",")
	end

	def generate_recipient_variables(target_subscribers)
		target_subscribers.each do |subscribers|
			
		end
	end
end