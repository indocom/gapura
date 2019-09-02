class TicketsController < ApplicationController
  def claim
    ensure_admin
    redirect_to admin_claim_ticket_path(claim_token: params[:claim_token])
  end
end
