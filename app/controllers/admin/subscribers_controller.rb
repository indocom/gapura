class Admin::SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def write_email
  end

  # Receive POST request from the form, and sends the email with the
  # POST parameters.
  def send_email
    blast_email(params[:body], params[:subject])

    puts params[:body]

    redirect_to admin_confirm_email_sent_path
  end

  def blast_email(body, subject)
    subscribers = Subscriber.where(unsubscribed: false)

    subscribers.each do |subscriber|
      ApplicationMailer.with(subscriber: subscriber, body: body,
        subject: subject).mail_personal.deliver_later
    end
  end

  # Displays some text to let the user know that the email has been successfully
  # sent.
  def confirm_email_sent
  end

  def unsubscribe
    subscriber = Subscriber.find_by(unsubscribe_code: params[:code])
    subscriber.unsubscribed = true
    subscriber.save()
    redirect_to '/', notice: 'You have successfully unsubscribed.'
  end

  def sync_with_customer
    customers = Customer.all

    customers.each do |customer|
      Subscriber.find_or_create_by(customer: customer)
    end

    redirect_to admin_subscribers_path
  end
end
