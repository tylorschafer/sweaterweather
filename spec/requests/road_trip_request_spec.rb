require 'rails_helper'

describe 'Road trip endpoint' do
  it 'Returns travel time and weather summary for a trip' do
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
    post '/api/v1/road_trip', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data]).to be_a Hash
    expect(results[:data][:trip_time]).to be_a String
    expect(results[:data][:weather_summary]).to be_a Hash
    expect(results[:data][:weather_summary][:temperature]).to be_a Float
    expect(results[:data][:weather_summary][:summary]).to be_a String
  end
end
