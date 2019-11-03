require 'rails_helper'

describe Flickr do
  it 'returns photos data for a location' do
    service = Flickr.new('denver,co')

    results = service.photo_finder

    expect(results).to be_a Hash
    expect(results[:photos][:photo][0][:id]).to be_a String
    expect(results[:photos][:photo][0][:title]).to be_a String
  end

  xit 'returns a photos details from photo id' do
    service = Flickr.new('denver,co')

    results = service.find_photo('49008133658')

    expect(results).to be_a Hash
    expect(results[:photo][:id]).to be_a String
    expect(results[:title][:_content]).to be_a String
    expect(results[:urls][:url][0][:_content]).to be_a String
  end
end
