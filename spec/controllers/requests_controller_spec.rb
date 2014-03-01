require 'spec_helper'
require 'securerandom'

describe RequestsController do
  describe 'GET #new' do
    it 'returns HTTP success' do
      get 'new'
      response.should be_success
    end
  end

  # describe 'POST #create' do
  #   it 'returns HTTP success' do
  #     post_data = {
  #       :rid             => SecureRandom.uuid,
  #       :request_type    => 'GET',
  #       :url             => 'http://google.com',
  #       :private_request => 1,
  #       :request_data => {
  #         :headers => { 'X-Example' => 'Example value'},
  #         :data    => {},
  #       }.to_json,
  #       :response_data => {
  #         :headers => { 'X-Example' => 'Example value'},
  #         :body    => 'Blah, body',
  #         :status  => 200,
  #       }.to_json
  #     }
  #
  #     post 'create', post_data
  #     response.should be_success
  #   end
  # end
end
