require 'rails_helper'

describe GoogleDirectionsService, :vcr do
  it 'Returns travel time for a trip' do
    trip = GoogleDirectionsService.new.find_trip("Denver,CO", "Pueblo,CO")

    expect(trip).to be_a Hash
    expect(trip[:routes][0][:legs][0][:duration][:text]).to be_a String

    trip = GoogleDirectionsService.trip_info("Denver,CO", "Pueblo,CO")
    expect(trip).to be_a Hash
    expect(trip[:distance]).to be_a String
    expect(trip[:duration]).to be_a String
  end
end
