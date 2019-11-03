require 'rails_helper'
require_relative 'dummy_response'

describe Forecast do
  it 'exists' do
    dummy_response = File.read('spec/models/dummy_response.rb')
    results = JSON.parse(dummy_response, symbolize_names: true)
    forecast = Forecast.new(results)

    expect(forecast).to be a Forecast
    expect(forecast.current).to be_a Hash
    expect(forecast.current[:temp]).to exist
    expect(forecast.current[:icon]).to exist
    expect(forecast.current[:summary]).to exist
    expect(forecast.current[:dal_temp_low]).to exist
    expect(forecast.current[:dal_temp_high]).to exist
    expect(forecast.current[:time]).to exist
    expect(forecast.current[:timezone]).to exist
    expect(forecast.current[:app_temp]).to exist
    expect(forecast.current[:humidity]).to exist
    expect(forecast.current[:visibility]).to exist
    expect(forecast.current[:day_summary]).to exist
    expect(forecast.current[:night_summary]).to exist
    expect(forecast.current[:uv]).to exist

    expect(forecast.next_8_hrs).to be_an Array
    expect(forecast.next_8_hrs).count to eq(8)
    expect(forecast.next_8_hrs[0]).to be_a Hash
    expect(forecast.next_8_hrs[0][:icon]).to exist
    expect(forecast.next_8_hrs[0][:temp]).to exist
    expect(forecast.next_8_hrs[0][:time]).to exist

    expect(forecast.weekly).to be_an Array
    expect(forecast.weekly).count to eq(5)
    expect(forecast.weekly[0]).to be_a Hash
    expect(forecast.weekly[0][:icon]).to exist
    expect(forecast.weekly[0][:percip_prob]).to exist
    expect(forecast.weekly[0][:temp_high]).to exist
    expect(forecast.weekly[0][:temp_low]).to exist
  end
end
