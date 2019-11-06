require 'rails_helper'

describe GoogleGeocodingService, :vcr do
  it 'Returns Lattitude and Longitude of a location' do
    result = GoogleGeocodingService.coordinates('denver,co')

    expect(result[:results]).to be_an Array
    expect(result[:results][0][:geometry][:bounds][:northeast][:lat]).to eq(39.91424689999999)
    expect(result[:results][0][:geometry][:bounds][:northeast][:lng]).to eq(-104.6002959)
  end
end
