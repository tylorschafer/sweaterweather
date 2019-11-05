require 'rails_helper'

describe DarkskyService do
  it 'returns forecast data for an address' do
    results = DarkskyService.get_forecast(39.7392358, -104.990251)

    expect(results).to be_a Hash
    expect(results[:currently]).to be_a Hash
    expect(results[:currently][:temperature]).to be_a Float
    expect(results[:currently][:summary]).to be_a String
    expect(results[:minutely]).to be_a Hash
    expect(results[:daily]).to be_an Hash
  end
end
