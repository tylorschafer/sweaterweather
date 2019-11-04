require 'rails_helper'

describe 'Backgrounds endpoint', :vcr do
  it 'Returns a random background image for the requested location' do
    get '/api/v1/backgrounds?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data]).to be_an Array
    expect(results[:data].count).to eq(10)
    expect(results[:data][0][:image_url]).to be_a String
    expect(results[:data][0][:title]).to be_a String
  end
end
