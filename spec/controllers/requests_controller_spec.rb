require 'spec_helper'
require 'securerandom'

describe RequestsController do
  describe 'GET #new' do
    it 'returns HTTP success' do
      get 'new'
      response.should be_success
    end
  end
end
