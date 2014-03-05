require 'spec_helper'

describe ApplicationHelper do
  describe '#title' do
    it 'always includes the base site name' do
      expect(title).to eq('ReHTTP')
    end

    it 'adds a page name when it is defined' do
      @page_name = 'Section title'
      expect(title).to eq('Section title · ReHTTP')
    end

    it 'add a sub page name when it is defined' do
      @page_name = 'Section title'
      @sub_page_name = 'Page example'
      expect(title).to eq('Page example · Section title · ReHTTP')
    end
  end

  describe '#path_with_digest' do
    it 'returns as a string' do
      expect(path_with_digest('application', 'css')).to be_instance_of(String)
    end
  end
end
