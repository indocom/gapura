module Admin
  class TicketsController < ApplicationController
    before_action :ensure_admin
    before_action :ensure_superuser, only: [:destroy, :new, :create, :send_confirmation_email]

    def index
      @tickets = Ticket.includes(:customer).order(:purchased_at)
    end

    def show
      @ticket = Ticket.includes(:customer).find(params[:id])
    rescue
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

    def clear_mock_tickets
      Ticket.where(ticket_type: "MOCK").destroy_all
      redirect_to admin_tickets_url, notice: 'All mock tickets have been successfully destroyed.'
    rescue
      redirect_to admin_tickets_url, flash: { popup_alert: 'Failed to destroy all mock tickets.' }
    end

    def send_confirmation_email
      @ticket = Ticket.find(params[:id])
      @ticket.send_confirmation_email
      redirect_to admin_tickets_url, notice: 'Confirmation ticket has been sent.'
    rescue
      redirect_to admin_tickets_url, flash: { popup_alert: 'Confirmation email failed to be sent.' }
    end

    private 
      def mock_ticket_params
        params.require(:ticket).permit(:name, :email, :quantity)
      end

      def create_ticket_from_mock_data(ticket_info)
        customer = Customer.find_or_create_by!(email: ticket_info[:email].downcase)
        ticket = nil
        5.times do |index|
          begin
            ticket = customer.tickets.create!(
              booking_reference: SecureRandom.base58(5),
              ticket_type: "MOCK",
              name: ticket_info[:name],
              quantity: ticket_info[:quantity],
              purchased_at: DateTime.now
            )
            break
          rescue
            raise if (index == 4)
          end 
        end

        return ticket
      end
  end
end
