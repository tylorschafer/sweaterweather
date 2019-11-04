require 'rails_helper'

describe 'Antipode endpoint', :vcr do
  it 'Returns the antipode city and forecast for that city' do
    get '/api/v1/antipode?location=hong+kong'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data]).to be_a Hash
    expect(results[:data][:type]).to eq('antipode')
    expect(results[:data][:attributes]).to be_a Hash
    expect(results[:data][:attributes][:location_name]).to be_a String
    expect(results[:data][:attributes][:forecast]).to be_a Hash
    expect(results[:data][:attributes][:forecast][:summary]).to be_a String
    expect(results[:data][:attributes][:forecast][:current_temperature]).to be_a Float
    expect(results[:data][:search_location]).to be_a String
  end
end
