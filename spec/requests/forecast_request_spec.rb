require 'rails_helper'

describe 'Forecast Endpoints', :vcr do
  it 'Returns a forecast for the requested location' do
    get '/api/v1/forecast?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data][:attributes][:current]).to be_a Hash
    expect(results[:data][:attributes][:current][:temp]).to be_a Float
    expect(results[:data][:attributes][:current][:icon]).to be_a String
    expect(results[:data][:attributes][:current][:summary]).to be_a String
    expect(results[:data][:attributes][:current][:dal_temp_low]).to be_a Float
    expect(results[:data][:attributes][:current][:dal_temp_high]).to be_a Float
    expect(results[:data][:attributes][:current][:time]).to be_a String
    expect(results[:data][:attributes][:current][:timezone]).to be_a String
    expect(results[:data][:attributes][:current][:app_temp]).to be_a Float
    expect(results[:data][:attributes][:current][:humidity]).to be_a Float
    expect(results[:data][:attributes][:current][:visibility]).to be_a (Integer)
    expect(results[:data][:attributes][:current][:day_summary]).to be_a String
    expect(results[:data][:attributes][:current][:night_summary]).to be_a String
    expect(results[:data][:attributes][:current][:uv]).to be_an Integer

    expect(results[:data][:attributes][:next_8_hrs]).to be_an Array
    expect(results[:data][:attributes][:next_8_hrs][0][:icon]).to be_a String
    expect(results[:data][:attributes][:next_8_hrs][0][:temp]).to be_a Float
    expect(results[:data][:attributes][:next_8_hrs][0][:time]).to be_a String
    expect(results[:data][:attributes][:next_8_hrs][8]).to be nil

    expect(results[:data][:attributes][:next_5_days]).to be_an Array
    expect(results[:data][:attributes][:next_5_days][0][:icon]).to be_a String
    expect(results[:data][:attributes][:next_5_days][0][:percip_prob]).to be_a Float
    expect(results[:data][:attributes][:next_5_days][0][:temp_high]).to be_a Float
    expect(results[:data][:attributes][:next_5_days][0][:temp_low]).to be_a Float
    expect(results[:data][:attributes][:next_5_days][5]).to be nil
  end
end
