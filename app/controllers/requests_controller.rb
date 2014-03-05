class RequestsController < ApplicationController
  include ApplicationHelper
  include RequestsHelper

  # Show an individual request.
  def show
    css_path = (development_environment?) ? 'application.css' : path_with_digest('application', 'css')
    js_path = (development_environment?) ? 'application.js' : path_with_digest('application', 'js')

    rid = find_request(params[:rid])
   
    if rid.present?
      setup_template_variables(rid)
      
      respond_to do |format|
        format.html { 
          render 'shared_request' 
        }
        format.js   {
          render :partial => 'requests/embed/embed',
          :locals => {
            :css_path => "#{site_url}/assets/#{css_path}",
            :js_path => "#{site_url}/assets/#{js_path}"
          }
        }
      end
    else
      render_404
    end
  end

  # Handle showing the raw request/response output data.
  def show_raw
    rid = find_request(params[:rid])
    
    if rid.present?
      setup_template_variables(rid)
      render :partial => 'single_request'
    else
      render_404
    end
  end

  def new
    @request = Requests.new
  end

  # Create a new request.
  def create
    @request = Requests.new(request_params)

    begin
      @request.save
    rescue Exception => e
      "[#{Time.now}] Failed to save new request for #{@request.rid}.\n" +
      "#{e.backtrace}"
    end

    render :layout => false
  end

  private
    # Build the request parameters and correct structure for inserting into the
    # database.
    def request_params
      rid                = create_uuid
      request_type       = params[:request_type]
      request_url        = params[:url]
      request_parameters = params[:request_parameters]
      request_headers    = params[:request_headers]
      request_payload    = params[:request_payload]
      username           = params[:username]
      password           = params[:password]
      private_request    = params[:private_request]

      request = Faraday.new

      # If authentication is filled out, apply it.
      if username.present?
        request.basic_auth(username, password)
      end

      # Be nice and send a descriptive user agent. Also handy for debugging and
      # tracking down potential problems.
      request.headers['User-Agent'] = 'ReHTTP/v1.0'

      # Split the additional headers out into the name and value and then apply
      # then to the request.
      request_headers.split("\r\n").each do |header|
        header_components = header.split(':')
        request.headers[header_components[0]] = header_components[1]
      end

      # Ensure the parameters are available before trying to create a new hash
      # from them.
      if request_parameters.present?
        request_params = Hash[request_parameters.split("\r\n").map {|params| params.split('=') }]
      else
        request_params = {}
      end

      case request_type
      when 'GET'
        response = request.get(request_url, request_params)
      when 'POST'
        response = request.post(request_url, request_payload)
      when 'PUT'
        response = request.put(request_url, request_params)
      when 'DELETE'
        response = request.delete request_url
      when 'OPTIONS'
        response = request.options request_url
      when 'HEAD'
        response = request.head request_url
      when 'PATCH'
        response = request.patch request_url
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

    # Find a request based on request ID.
    #
    # Returns the request object as well as nicely formatted request and
    # response data.
    def find_request(rid)
      rid = Requests.find_by(rid: rid)
    end

    # Expose instance variables for the templates to use.
    #
    # Based on the request ID, make the response data and request data
    # available.
    def setup_template_variables(rid)
      @rid = rid
      @request_data = JSON.parse @rid.request_data
      @response_data = JSON.parse @rid.response_data
    end
end
