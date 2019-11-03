require 'rails_helper'

describe 'Forecast Endpoints' do
  xit 'Returns a forecast for the requested location' do
    response = get '/api/v1/forecast?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:data][:current]).to be_a Hash
    expect(results[:data][:current][:temp]).to exist
    expect(results[:data][:current][:icon]).to exist
    expect(results[:data][:current][:summary]).to exist
    expect(results[:data][:current][:dal_temp_low]).to exist
    expect(results[:data][:current][:dal_temp_high]).to exist
    expect(results[:data][:current][:time]).to exist
    expect(results[:data][:current][:timezone]).to exist
    expect(results[:data][:current][:app_temp]).to exist
    expect(results[:data][:current][:humidity]).to exist
    expect(results[:data][:current][:visibility]).to exist
    expect(results[:data][:current][:day_summary]).to exist
    expect(results[:data][:current][:night_summary]).to exist
    expect(results[:data][:current][:uv]).to exist

    expect(results[:data][:next_8_hrs]).to be_an Array
    expect(results[:data][:next_8_hrs][0][:icon]).to exist
    expect(results[:data][:next_8_hrs][0][:temp]).to exist
    expect(results[:data][:next_8_hrs][0][:time]).to exist
    expect(results[:data][:next_8_hrs][8]).to be nil

    expect(results[:data][:weekly]).to be_an Array
    expect(results[:data][:weekly][0][:icon]).to exist
    expect(results[:data][:weekly][0][:percip_prob]).to exist
    expect(results[:data][:weekly][0][:temp_high]).to exist
    expect(results[:data][:weekly][0][:temp_low]).to exist
    expect(results[:data][:weekly][5]).to_not exist

    # expect(results[:data][:adress]).to exist
  end
end
