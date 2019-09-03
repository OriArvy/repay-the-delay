class ClaimsController < ApplicationController


  def create
    # get info from params
    @origin = params[:origin]
    @destination = params[:destination]
    @departure_time = params[:departure_time]
    @train_id = params[:train_id].to_i

    # run API call on specific train
    api_call_train_detail(@train_id)

    # retrieve information from API call
    @date = @response_complete["date_of_service"]
    @delay_duration = calculate_delay(@result)
    @reason_for_delay = @result["late_canc_reason"]

    # create claim
    @claim = Claim.new(delay_duration: @delay_duration, departure_date: @date, train_id: @train_id, reason_for_delay: @reason_for_delay, location_from: @origin, location_to: @destination, departure_time: @departure_time)
    @user = current_user
    # @ticket = @current_user.tickets[0]
    # @claim.ticket = @ticket
    @claim.user = @user

    if @claim.save
      redirect_to claim_path(@claim)
    else
      redirect_to root_path
    end
  end

  def show
    @claim = Claim.find(params[:id])
    @delay_reason = Cancel.find_by_code(@claim.reason_for_delay)
      # define variabel for trains eligble for a refund
    if @claim.delay_duration.to_i >= 15 || @claim.delay_duration == "Train cancelled"
      @train_late_or_cancelled = true
    else
      @train_late_or_cancelled = false
    end
  end

  def update
    @claim = Claim.find(params[:id])
    ticket = Ticket.find(params[:claim][:ticket_id])
    @claim.ticket = ticket
    @claim.save
    sleep(2)
    redirect_to claims_path
  end

  def index
    @stations = Station.all
    @cancels = Cancel.all

    @sum = 0
    current_user.claims.each do |claim|
      @sum += claim.savings if !claim.savings.nil?
    end

    @claims_pending = 0
    current_user.claims.each do |claim|
       @claims_pending += 1 if claim.status == "pending"
    end

    @claims_completed = 0
    current_user.claims.each do |claim|
       @claims_completed += 1 if claim.status == "completed"
    end

  end

  private

  def api_call_train_detail(train_id)

    url = "https://hsp-prod.rockshore.net/api/v1/serviceDetails"

    begin
      response = RestClient.post(url, {rid: train_id}.to_json, {"Content-Type"=>'application/json', "Authorization" => ENV['HSP_API_KEY']})
    rescue => e
      flash[:alert] = "No result...try again"
      return redirect_to root_path
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

  def calculate_delay(result)
    require 'date'
    if result['actual_ta'] == ""
      delay_in_min = "Train cancelled"
    else
      planned = DateTime.strptime(result['gbtt_pta'], '%M%S')
      actual = DateTime.strptime(result['actual_ta'], '%M%S')
      delay_in_min = ((actual - planned)*3600*24).to_i.to_s
    end
  end

end

