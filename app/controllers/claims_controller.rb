class ClaimsController < ApplicationController

  def create
    @origin = params[:origin]
    @destination = params[:destination]
    @departure_time = params[:departure_time]

    @train_id = params[:train_id]

    api_call_train_detail

    @date = @response_complete["date_of_service"]
    # delay_duration = @result
    @reason_for_delay = @result["late_canc_reason"]

    @claim = Claim.new(location_from: @origin, location_to: @destination, departure_time: @departure_time)
    @user = current_user
    @ticket = @current_user.tickets[0]
    @claim.user = @user
    @claim.ticket = @ticket

    if @claim.save
      redirect_to claim_path(@claim)
    else
      redirect_to root_path
    end
  end

  def show
    @claim = Claim.find(params[:id])
  end

  private

  def api_call_train_detail

    api_key = ENV['HSP_API_KEY']
    url = "https://hsp-prod.rockshore.net/api/v1/serviceDetails"

    train_id = 201908268113516
    begin
      response = RestClient.post(url, {rid: train_id}.to_json, {"Content-Type"=>'application/json', "Authorization" => ENV['HSP_API_KEY']})
    rescue => e
      e.response
    end
    # convert the hash of the complete response and access the information on arrivals
    @response_complete = JSON.parse(response.body)["serviceAttributesDetails"]
    response_details = JSON.parse(response.body)["serviceAttributesDetails"]["locations"]

    # extract the hash with the information on my arrival and save it as result
    response_details.each do |item|
     if item["location"] == @destination
      @result = item
     end
    end

  end
end

# location_from, :location_to, :departure_time, presence: true
