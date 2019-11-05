require 'rails_helper'

describe FlickrService do
  it 'returns photos for a location' do
    service = FlickrService.new

    results = service.photos_finder('denver,co')

    expect(results).to be_a Hash
    expect(results[:photos][:photo][0][:id]).to be_a String
    expect(results[:photos][:photo][0][:title]).to be_a String
  end

  it 'returns a photos details from photo id' do
    service = FlickrService.new

    results = service.find_photo('49008133658')

    expect(results).to be_a Hash
    expect(results[:photo][:id]).to be_a String
    expect(results[:photo][:title][:_content]).to be_a String
    expect(results[:photo][:urls][:url][0][:_content]).to be_a String
  end

  it 'returns a collection of found photos' do
    results = FlickrService.get_photos('denver,co')

    expect(results[0][:photo][:id]).to be_a String
  end
end
