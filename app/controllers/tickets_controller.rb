class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @user = current_user
    @ticket.user = @user
    if @ticket.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:ticket_number, :price, :valid_from, :expiry_date, :ticket_type, :ticket_photo)
  end
end
