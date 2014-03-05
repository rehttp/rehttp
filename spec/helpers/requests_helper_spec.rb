require 'spec_helper'

describe RequestsHelper do
  describe '#format_http_header' do
    it 'correctly formats HTTP headers' do
      expect(format_http_header('x-cache-control')).to eq('X-Cache-Control')
    end
  end

  describe '#json_response?' do
    context 'when header contains JSON' do
      it 'returns true' do
        content_type_header = 'application/json; charset=utf-8'
        expect(json_response?(content_type_header)).to be_true
      end
    end

    context 'when header does not contain JSON' do
      it 'returns false' do
        content_type_header = 'text/html; charset=utf-8'
        expect(json_response?(content_type_header)).to be_false
      end
    end
  end

  describe '#request_method_options' do
    it 'should return as an array' do
      expect(request_method_options).to be_instance_of(Array)
    end
  end
end
