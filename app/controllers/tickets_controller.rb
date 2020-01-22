# frozen_string_literal: true

class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :synchronize

  def claim
    ensure_admin
    return if performed?

    redirect_to admin_claim_ticket_path(claim_token: params[:claim_token])
  end

  def synchronize
    not_found && return unless params[:sync_token] == ENV['TICKET_SYNC_TOKEN']

    tickets = []
    ActiveRecord::Base.transaction do
      new_transactions = fetch_new_transactions
      new_transactions.each do |transaction|
        new_ticket = create_ticket_from_transaction(transaction)
        tickets.push(new_ticket)
      end
    end

    send_confirmation_emails(tickets)

    flash[:notice] = 'Tickets have successfully been synchronized!'
    redirect_to root_path
  end

  private

  def fetch_new_transactions
    new_transactions =
      Transaction.where('created_at > ?', LastTransaction.first.time)

    unless new_transactions.empty?
      LastTransaction.update_all(time: new_transactions.maximum('created_at'))
    end

    new_transactions
  end

  # rubocop:todo Metrics/MethodLength
  def create_ticket_from_transaction(transaction)
    customer = Customer.find_or_create_by!(email: transaction.email.downcase)
    ticket = nil
    5.times do |index|
      ticket =
        customer.tickets.create!(
          booking_reference: transaction.booking_reference,
          ticket_type: transaction.ticket_type,
          name: transaction.name,
          quantity: transaction.quantity,
          purchased_at: transaction.purchased_at
        )
      break
    rescue StandardError
      raise if index == 4
    end

    ticket
  end
  # rubocop:enable Metrics/MethodLength

  def send_confirmation_emails(tickets)
    tickets.each(&:send_confirmation_email)
  end # rubocop:todo Metrics/MethodLength
end
