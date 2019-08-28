class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
  end

  def search

    api_call_trains
    api_call_train_detail
  end

  private

  def find_weekday(date)
    day_type = ""
    date_converted = Date.parse(date)
    if (1..5).include?(date_converted.wday)
      day_type = "WEEKDAY"
    elsif date_converted.wday == 6
      day_type = "SATURDAY"
    else
      day_type = "SUNDAY"
    end
    return day_type
  end


  def api_call_trains
    @from = params[:origin]
    @to = params[:destination]

    # this splits date and time you get from the user and assigns it to the variables for the API Call
    @date = params[:departure][:time].split("T")[0]
    time_from_form = params[:departure][:time].split("T")[1]
    # time from form is converted so we can calculate the window for the departure times. Then its converted back to be in the 1250 format.
    converted_time = Time.parse(time_from_form)
    dep_time_start = (converted_time - 900).strftime("%H%M")
    dep_time_end = (converted_time + 900).strftime("%H%M")

    day_type = find_weekday(@date)
    search_url = "https://hsp-prod.rockshore.net/api/v1/serviceMetrics"

    begin
      response = RestClient.post(search_url, {from_loc: @from, to_loc: @to, from_time: dep_time_start, to_time: dep_time_end, from_date: @date, to_date: @date, days: day_type}.to_json, {"Content-Type"=>'application/json', "Authorization" => ENV['HSP_API_KEY']})
    rescue => e
      e.response
    end
    @response_trains = JSON.parse(response.body)


# from_loc = hash["headers"]
# from_loc = hash["from_location"]
# to_loc = hash["to_location"]
# will get the times for the list of trains




  end

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
    response_details = JSON.parse(response.body)["serviceAttributesDetails"]["locations"]

    # extract the hash with the information on my arrival and save it as result
    response_details.each do |item|
     if item["location"] == @to
      @result = item
     end
    end



  end
end


# Formats for API Call on train times:
# from = "WTY"
# to = "CLJ"
# dep_time = "1501"
# date = "2019-08-26"
