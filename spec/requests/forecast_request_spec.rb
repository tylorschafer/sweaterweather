require 'rails_helper'

describe 'Forecast Endpoints' do
  it 'Returns a forecast for the requested location' do
    get '/api/v1/forecast?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data][:current]).to be_a Hash
    expect(results[:data][:current][:temp]).to be_a Float
    expect(results[:data][:current][:icon]).to be_a String
    expect(results[:data][:current][:summary]).to be_a String
    expect(results[:data][:current][:dal_temp_low]).to be_a Float
    expect(results[:data][:current][:dal_temp_high]).to be_a Float
    expect(results[:data][:current][:time]).to be_a String
    expect(results[:data][:current][:timezone]).to be_a String
    expect(results[:data][:current][:app_temp]).to be_a Float
    expect(results[:data][:current][:humidity]).to be_a Float
    expect(results[:data][:current][:visibility]).to be_an Integer
    expect(results[:data][:current][:day_summary]).to be_a String
    expect(results[:data][:current][:night_summary]).to be_a String
    expect(results[:data][:current][:uv]).to be_an Integer

    expect(results[:data][:next_8_hrs]).to be_an Array
    expect(results[:data][:next_8_hrs][0][:icon]).to be_a String
    expect(results[:data][:next_8_hrs][0][:temp]).to be_a Float
    expect(results[:data][:next_8_hrs][0][:time]).to be_a String
    expect(results[:data][:next_8_hrs][8]).to be nil

    expect(results[:data][:next_5_days]).to be_an Array
    expect(results[:data][:next_5_days][0][:icon]).to be_a String
    expect(results[:data][:next_5_days][0][:percip_prob]).to be_a Float
    expect(results[:data][:next_5_days][0][:temp_high]).to be_a Float
    expect(results[:data][:next_5_days][0][:temp_low]).to be_a Float
    expect(results[:data][:next_5_days][5]).to be nil
  end
end
