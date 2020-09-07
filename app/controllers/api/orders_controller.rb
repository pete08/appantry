class Api::OrdersController < ApplicationController
  
  def index
    # @user_items = UserItem.where(user_id: current_user.id) 
    p "*" * 45
    # @user_items = @user_items.where(used: "false", future_interest: "true")

    require "uri"
    require "net/http"


    # response = https.request(request)
    # puts response.read_body
    

    basic = Rails.application.credentials.postmate[:basic]
    cfduid = Rails.application.credentials.postmate[:cfduid]
    url = URI("https://api.postmates.com/v1/customers/cus_MpJ0a1nOMVs49F/deliveries?dropoff_name=bobby&dropoff_phone_number=2145788448&manifest=box of box&pickup_name=bill&pickup_phone_number=3125258989&")

    https = Net::HTTP.new(url.host, url.port);
    # https.basic_auth = 'user' 'pass'
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request["Authorization"] = "Basic #{basic}"
    request["Cookie"] = "__cfduid=#{cfduid}"
    request.body =  "dropoff_address=701%20Mission%20St.%20San%20Francisco%2C%20CA&pickup_address=201%20Third%20St.%20San%20Francisco%2C%20CA"
    
    response = https.request(request)
    puts response
    data = response.read_body

    # puts data.class
    puts "*" * 45

    datahash = JSON.parse(data.gsub("=>", ":").gsub(":nil,", ":null,"))



    p datahash["pickup"]
    stuff = datahash["pickup"]
    render json: {message: stuff}

  end
end
