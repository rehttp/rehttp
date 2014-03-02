require 'spec_helper'

describe RequestsHelper do
  it 'correctly formats HTTP headers' do
    expect(format_http_header('x-cache-control')).to eq('X-Cache-Control')
  end

  it 'returns true when JSON is in the header string' do
    content_type_header = 'application/json; charset=utf-8'
    expect(json_response?(content_type_header)).to be_true
  end

  it 'returns false when JSON is not in the header' do
    content_type_header = 'text/html; charset=utf-8'
    expect(json_response?(content_type_header)).to be_false
  end
end
