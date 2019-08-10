module Admin
  class TicketsController < ApplicationController
    before_action :ensure_admin

    def index
      @tickets = Ticket.includes(:user).order(:created_at)
    end

    def show
      @ticket = Ticket.includes(:user).find(params[:id])
    rescue
      not_found
    end

    def create
      ticket = current_user.tickets.create(note: 'Mock Ticket')
      flash[:notice] = "Ticket has been created!!!"
      redirect_to admin_ticket_url(ticket)
    end

    def claim
      @ticket = Ticket.includes(:user).find_by!(claim_token: params['claim_token'])
    rescue
      not_found
    end

    def redeem
    end
  end
end
