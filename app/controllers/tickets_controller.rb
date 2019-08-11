class TicketsController < ApplicationController
  before_action :ensure_login

  def index
    @tickets = current_user.tickets
  end

  # callback after buying tickets
  def create
    fail
  end

  def claim
    if current_user.has_role? :admin
      redirect_to admin_claim_ticket_path(claim_token: params[:claim_token])
    else
      flash[:alert] = 'Please show the barcode to NUANSA admin!'
      redirect_to tickets_path
    end
  end
end
