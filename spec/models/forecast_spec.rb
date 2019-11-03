require 'rails_helper'
require_relative 'dummy_darksky_response'

describe Forecast do
  it 'exists' do
    dummy_response = File.read('spec/models/dummy_darksky_response.rb')
    results = JSON.parse(dummy_response, symbolize_names: true)
    forecast = Forecast.new(results)

    expect(forecast).to be_a Forecast
    expect(forecast.current).to be_a Hash
    expect(forecast.current[:temp]).to be_a Float
    expect(forecast.current[:icon]).to be_a String
    expect(forecast.current[:summary]).to be_a String
    expect(forecast.current[:dal_temp_low]).to be_a Float
    expect(forecast.current[:dal_temp_high]).to be_a Float
    expect(forecast.current[:time]).to be_a String
    expect(forecast.current[:timezone]).to be_a String
    expect(forecast.current[:app_temp]).to be_a Float
    expect(forecast.current[:humidity]).to be_a Float
    expect(forecast.current[:visibility]).to be_a Integer
    expect(forecast.current[:day_summary]).to be_a String
    expect(forecast.current[:night_summary]).to be_a String
    expect(forecast.current[:uv]).to be_an Integer

    expect(forecast.next_8_hrs).to be_an Array
    expect(forecast.next_8_hrs.count).to eq(8)
    expect(forecast.next_8_hrs[0]).to be_a Hash
    expect(forecast.next_8_hrs[0][:icon]).to be_a String
    expect(forecast.next_8_hrs[0][:temp]).to be_a Float
    expect(forecast.next_8_hrs[0][:time]).to be_a String

    expect(forecast.next_5_days).to be_an Array
    expect(forecast.next_5_days.count).to eq(5)
    expect(forecast.next_5_days[0]).to be_a Hash
    expect(forecast.next_5_days[0][:icon]).to be_a String
    expect(forecast.next_5_days[0][:percip_prob]).to be_a Float
    expect(forecast.next_5_days[0][:temp_high]).to be_a Float
    expect(forecast.next_5_days[0][:temp_low]).to be_a Float
  end
end
