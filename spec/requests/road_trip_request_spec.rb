require 'rails_helper'

describe 'Road trip endpoint' do
  xit 'Returns travel time and weather summary for a trip' do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    post :road_trip, body: body

    results = JSON.parse(response.body)

    expect(results).to be_a Hash
    expect(results[:data]).to be_a Hash
    expect(results[:data][:trip_time]).to eq("1 hour 48 mins")
    expect(results[:data][:weather_summary]).to be_a Hash
    expect(results[:data[:weather_summary][:temp]]).to be_a Float
    expect(results[:data][:weather_summary][:summary]).to be_a String
  end
end
