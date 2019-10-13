module Admin
  class TicketsController < ApplicationController
    before_action :ensure_admin
    before_action :ensure_superuser, only: :destroy

    def index
      @tickets = Ticket.includes(:customer).order(:purchased_at)
    end

    def show
      @ticket = Ticket.includes(:customer).find(params[:id])
    rescue
      not_found
    end

    # This method is currently outdated.
    def create
      fail
      customer = Customer.find_or_create_by(email: current_user.email)
      ticket = customer.tickets.create(ticket_type: 'Mock', purchased_at: DateTime.now)
      ticket.send_confirmation_email
      flash[:notice] = "Ticket has been created!!!"
      redirect_to admin_ticket_url(ticket)
    rescue
      not_found
    end

    # This method is currently outdated.
    def claim
      fail
      @customer = Customer.find_by!(claim_token: params['claim_token'])
      @tickets = @customer.tickets.order(:purchased_at)
    rescue
      not_found
    end

    # This method is currently outdated.
    def redeem
      fail
    end

    def destroy
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
      redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.'
    end

    def send_confirmation_email
      @ticket = Ticket.find(params[:id])
      @ticket.send_confirmation_email
      redirect_to admin_tickets_url, notice: 'Confirmation ticket has been sent.'
    rescue
      redirect_to admin_tickets_url, flash: { popup_alert: 'Confirmation email failed to be sent.' }
    end
  end
end
