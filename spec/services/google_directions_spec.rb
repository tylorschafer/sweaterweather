require 'rails_helper'

describe GoogleDirections do
  it 'Returns travel time for a trip' do
    trip = GoogleDirections.trip_info("Denver,CO", "Pueblo,CO")

    expect(trip).to be_a Hash
    expect(trip[:routes][0][:legs][0][:duration][:text]).to be_a String
  end
end
