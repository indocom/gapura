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

    def create
      customer = Customer.find_or_create_by(email: current_user.email)
      ticket = customer.tickets.create(note: 'Mock Ticket', purchased_at: DateTime.now)
      flash[:notice] = "Ticket has been created!!!"
      redirect_to admin_ticket_url(ticket)
    end

    def claim
      @customer = Customer.find_by!(claim_token: params['claim_token'])
      @tickets = @customer.tickets.order(:purchased_at)
    rescue
      not_found
    end

    # This method is not ready due to the latest changes
    def redeem
      fail
      @ticket = Ticket.includes(:user).find_by!(claim_token: params[:claim_token])

      raise ArgumentError if @ticket.claimed?

      @ticket.claimed_at = DateTime.current
      @ticket.claimed_by = current_user.username
      @ticket.save

      flash[:notice] = "Ticket has been redeemed"
      redirect_to admin_ticket_url(@ticket)
    rescue
      not_found
    end

    def destroy
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
      redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.'
    end

    def send_confirmation_email
      @ticket = Ticket.find(params[:id])
      @customer = @ticket.customer
      ApplicationMailer.with(customer: @customer).ticket_confirmation.deliver_later
      @customer.last_confirmation_email = DateTime.now
      @customer.save
      redirect_to admin_tickets_url, notice: 'Confirmation ticket has been sent.'
    end
  end
end
