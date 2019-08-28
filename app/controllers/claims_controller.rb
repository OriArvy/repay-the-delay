class ClaimsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    raise
    # @claim = Claim.new(location_from: "#{}", location_to:, :departure_time:)
    # @user = current_user
    # @booking = Booking.find(params[:booking_id])
    # @review.booking = @booking
    # if @review.save
    #   redirect_to venue_path(@booking.venue)
    # else
    #   render :new
    # end
  end

  def show
  end
end
