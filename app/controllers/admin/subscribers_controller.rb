# frozen_string_literal: true

class Admin::SubscribersController < ApplicationController
  before_action :ensure_superuser, except: :unsubscribe

  def index
    @subscribers = Subscriber.all
  end

  def write_email; end

  # Receive POST request from the form, and sends the email with the
  # POST parameters.
  def send_email
    blast_email(params[:greeting], params[:body], params[:subject])

    redirect_to admin_confirm_email_sent_path
  end

  def blast_email(greeting, body, subject)
    subscribers = Subscriber.where(unsubscribed: false)

    subscribers.each do |subscriber|
      ApplicationMailer.with(
        subscriber: subscriber, greeting: greeting, body: body, subject: subject
      )
        .mail_personal
        .deliver_now
    end
  end

  # Displays some text to let the user know that the email has been successfully
  # sent.
  def confirm_email_sent; end

  def unsubscribe
    subscriber = Subscriber.find_by!(unsubscribe_code: params[:code])
    subscriber.unsubscribed = true
    subscriber.save
    redirect_to '/', notice: 'You have successfully unsubscribed.'
  rescue StandardError
    not_found
  end

  def sync_with_customer
    customers = Customer.all

    customers.each do |customer|
      Subscriber.find_or_create_by(customer: customer)
    end

    redirect_to admin_subscribers_path
  end
end
