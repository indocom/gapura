# frozen_string_literal: true

module Admin
  class TicketsController < ApplicationController
    before_action :ensure_admin
    before_action :ensure_superuser,
                  only: %i[destroy new create send_confirmation_email]

    def index
      @tickets = Ticket.includes(:customer).order(:purchased_at)
    end

    def show
      @ticket = Ticket.includes(:customer).find(params[:id])
    rescue StandardError
      not_found
    end

    def new
      @ticket = Ticket.new
    end

    def create
      new_ticket = create_ticket_from_mock_data(mock_ticket_params)
      new_ticket.send_confirmation_email

      flash[:notice] = 'Ticket has been created!!!'
      redirect_to admin_ticket_url(new_ticket)
    rescue StandardError
      not_found
    end

    def claim
      @ticket = Ticket.find_by!(claim_token: params['claim_token'])
    rescue StandardError
      not_found
    end

    # rubocop:todo Metrics/MethodLength
    def redeem
      @ticket = Ticket.find_by!(claim_token: params[:claim_token])
      total_claim = params[:quantity]

      @ticket.claim_histories.create!(
        claimed_by: current_user.username,
        claimed_at: DateTime.now,
        claim_quantity: total_claim
      )

      redirect_to admin_claim_ticket_url(claim_token: @ticket.claim_token),
                  notice:
                    'You are claiming for' \
                      " #{total_claim} #{'people'.pluralize(total_claim)}"
    rescue StandardError
      redirect_to admin_claim_ticket_url(claim_token: @ticket.claim_token),
                  flash: {
                    popup_alert: 'There is an error in claiming the ticket.'
                  }
    end
    # rubocop:enable Metrics/MethodLength

    def destroy
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
      redirect_to admin_tickets_url,
                  notice: 'Ticket was successfully destroyed.'
    end

    def clear_mock_tickets
      Ticket.where(ticket_type: 'MOCK').destroy_all
      redirect_to admin_tickets_url,
                  notice: 'All mock tickets have been successfully destroyed.'
    rescue StandardError
      redirect_to admin_tickets_url,
                  flash: { popup_alert: 'Failed to destroy all mock tickets.' }
    end

    def send_confirmation_email
      @ticket = Ticket.find(params[:id])
      @ticket.send_confirmation_email
      redirect_to admin_tickets_url,
                  notice: 'Confirmation ticket has been sent.'
    rescue StandardError
      redirect_to admin_tickets_url,
                  flash: {
                    popup_alert: 'Confirmation email failed to be sent.'
                  }
    end

    private

    def mock_ticket_params
      params.require(:ticket).permit(:name, :email, :quantity)
    end

    # rubocop:todo Metrics/MethodLength
    def create_ticket_from_mock_data(ticket_info)
      customer =
        Customer.find_or_create_by!(email: ticket_info[:email].downcase)
      ticket = nil
      5.times do |index|
        ticket =
          customer.tickets.create!(
            booking_reference: SecureRandom.base58(5),
            ticket_type: 'MOCK',
            name: ticket_info[:name],
            quantity: ticket_info[:quantity],
            purchased_at: DateTime.now
          )
        break
      rescue StandardError
        raise if index == 4
      end

      ticket
    end
    # rubocop:enable Metrics/MethodLength # rubocop:todo Metrics/AbcSize # rubocop:todo Metrics/AbcSize
  end
end
