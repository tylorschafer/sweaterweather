require 'rails_helper'

describe Trip do
  it 'Can exist' do
    params = {
      distance: '138 miles',
      duration: '1 hr 39 mins',
      weather_summary: {
        temperature: 98.1,
        summary: 'Its going to be a hot one!'
      }
    }

    trip = Trip.new(params)

    expect(trip).to be_a Trip
    expect(trip.distance).to eq(params[:distance])
    expect(trip.duration).to eq(params[:duration])
    expect(trip.weather_summary).to be_a Hash
    expect(trip.weather_summary[:temperature]).to eq(params[:weather_summary][:temperature])
    expect(trip.weather_summary[:summary]).to eq(params[:weather_summary][:summary])
  end
end
