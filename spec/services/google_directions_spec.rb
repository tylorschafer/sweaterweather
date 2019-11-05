require 'rails_helper'

describe GoogleDirectionsService do
  it 'Returns travel time for a trip' do
    trip = GoogleDirectionsService.trip_info("Denver,CO", "Pueblo,CO")

    expect(trip).to be_a Hash
    expect(trip[:routes][0][:legs][0][:duration][:text]).to be_a String
  end
end
