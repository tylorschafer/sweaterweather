require 'rails_helper'

describe 'Road trip endpoint' do
  it 'Returns travel time and weather summary for a trip' do
    user = create(:user)
    token = user.generate_token
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": token
    }
    post '/api/v1/road_trip', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data]).to be_a Hash
    expect(results[:data][:attributes][:distance]).to be_a String
    expect(results[:data][:attributes][:duration]).to be_a String
    expect(results[:data][:attributes][:weather_summary]).to be_a Hash
    expect(results[:data][:attributes][:weather_summary][:temperature]).to be_a Float
    expect(results[:data][:attributes][:weather_summary][:summary]).to be_a String
  end

  it 'Will not allow access without a valid API Token' do
    user = create(:user)
    token = user.generate_token
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "fake token"
    }
    post '/api/v1/road_trip', params: body, as: :json
    expect(response.body).to eq('Invalid Key')
  end
end
