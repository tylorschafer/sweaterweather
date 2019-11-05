require 'rails_helper'

describe Flickr, :vcr do
  it 'returns photos for a location' do
    service = Flickr.new('denver,co')

    results = service.photo_finder

    expect(results).to be_a Hash
    expect(results[:photos][:photo][0][:id]).to be_a String
    expect(results[:photos][:photo][0][:title]).to be_a String
  end

  it 'returns a photos details from photo id' do
    service = Flickr.new('denver,co')

    results = service.find_photo('49008133658')

    expect(results).to be_a Hash
    expect(results[:photo][:id]).to be_a String
    expect(results[:photo][:title][:_content]).to be_a String
    expect(results[:photo][:urls][:url][0][:_content]).to be_a String
  end

  it 'returns a collection of found photos' do
    service = Flickr.new('denver,co')

    results = service.returned_photos

    expect(results[0][:photo][:id]).to be_a String
  end
end
