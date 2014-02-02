require 'securerandom'

class RequestsController < ApplicationController
  # Show an individual request.
  def show
    @rid = Requests.find_by(rid: params[:rid])
    @request_data = JSON.parse @rid.request_data
    @response_data = JSON.parse @rid.response_data
    @url = @rid.url
    @request_type = @rid.request_type

    render partial: 'single_request'
  end

  def new
    @request = Requests.new
  end

  # Create a new request.
  def create
    @request = Requests.new(request_params)
    @request.save
    render :layout => false
  end

  private
    # Build the request parameters and correct structure for inserting into the
    # database.
    def request_params
      rid             = SecureRandom.uuid
      request_type    = params[:request_type]
      request_url     = params[:url]
      request_data    = {}
      username        = params[:username]
      password        = params[:password]
      private_request = params[:private_request]

      request = Faraday.new

      # If authentication is filled out, apply it.
      if username.present?
        request.basic_auth(username, password)
      end

      # Be nice and send a descriptive user agent. Also handy for debugging and
      # tracking down potential problems.
      request.headers['User-Agent'] = 'ReHTTP/v1.0'

      case request_type
      when 'GET'
        response = request.get request_url
      when 'POST'
        response = request.post(request_url, request_data)
      end

      {
        :rid             => rid,
        :request_type    => request_type,
        :url             => request_url,
        :private_request => private_request,
        :request_data => {
          :headers => request.headers,
          :data    => {},
        }.to_json,
        :response_data => {
          :headers => response.headers,
          :body    => response.body,
          :status  => response.status,
        }.to_json
      }
    end
end
