require 'spec_helper'

describe RequestsController do
  describe 'GET #new' do
    it 'returns HTTP success' do
      get 'new'
      response.should be_success
    end
  end

  describe 'POST #create' do
    it 'returns HTTP success' do
      request = build(:requests)
      response.should be_success
    end
  end

  describe 'GET #show_raw' do
    context 'when request ID is available' do
      it 'returns HTTP success' do
        request = create(:requests)
        get 'show_raw', :rid => request.rid

        response.should be_success
      end
    end

    context 'when request ID is not created' do
      it 'throws a 404' do
        get 'show_raw', :rid => create_uuid
        
        expect(response.status).to eq(404)
      end
    end

    context 'when a request is private' do 
      it 'appends correct no-cache headers' do
        # check the cache control header
      end
    end
  end
end
