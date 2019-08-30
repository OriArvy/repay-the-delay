class TicketsController < ApplicationController

  def new
    @claim = Claim.find(params[:claim_id])
    @ticket = Ticket.new
  end

  def create
    @claim = Claim.find(params[:claim_id])
    @ticket = Ticket.new(ticket_params)
    @user = current_user
    @ticket.user = @user
    if @ticket.save
      redirect_to claim_path(@claim)
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:ticket_number, :price, :expiry_date, :ticket_type, :photo)
  end

end
