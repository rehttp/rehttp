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
      request = send_get_request(params[:url])
      request.headers = { 'User-Agent' => 'ReHTTP/1.0' }
      response = request.get

      {
        :rid             => SecureRandom.uuid,
        :request_type    => params[:request_type],
        :url             => params[:url],
        :private_request => params[:private_request],
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

    def send_get_request(url)
      conn = Faraday.new(url)
    end
end
