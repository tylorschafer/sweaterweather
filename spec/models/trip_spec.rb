require 'rails_helper'

describe Trip do
  it 'Can exist' do
    trip_data =  { distance: '138 miles', duration: '1 hr 39 mins' }
    weather = { temperature: 98.1, summary: 'Its going to be a hot one!' }

    trip = Trip.new(trip_data, weather)

    expect(trip).to be_a Trip
    expect(trip.distance).to eq(trip_data[:distance])
    expect(trip.duration).to eq(trip_data[:duration])
    expect(trip.weather_summary).to be_a Hash
    expect(trip.weather_summary[:temperature]).to eq(weather[:temperature])
    expect(trip.weather_summary[:summary]).to eq(weather[:summary])
  end
end
