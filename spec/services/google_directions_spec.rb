require 'rails_helper'

describe GoogleDirections do
  xit 'Returns travel time for a trip' do
    trip = GoogleDirections.trip_info({ origin: "Denver,CO", destination: "Pueblo,CO" })

    expect(trip).to be_a Hash
    expect(trip[:routes][:legs][:duration][:text]).to be_a String
  end
end
