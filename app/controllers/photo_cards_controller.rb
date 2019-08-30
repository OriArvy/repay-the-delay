class PhotoCardsController < ApplicationController
  def new
    @claim = Claim.find(params[:claim_id])
    @photo_card = PhotoCard.new
  end

  def create
    @claim = Claim.find(params[:claim_id])
    @photo_card = PhotoCard.new(photocard_params)
    @user = current_user
    @photo_card.user = @user
    if @photo_card.save
      redirect_to claim_path(@claim)
    else
      render :new
    end
  end

  private

  def photocard_params
    params.require(:photo_card).permit(:photo, :card_number)
  end
end
