require 'rails_helper'

describe Darksky, :vcr do
  it 'returns forecast data for an address' do
    service = Darksky.new(39.7392358, -104.990251)

    results = service.json_response

    expect(results).to be_a Hash
    expect(results[:currently]).to be_a Hash
    expect(results[:currently][:temperature]).to be_a Float
    expect(results[:currently][:summary]).to be_a String
    expect(results[:minutely]).to be_a Hash
    expect(results[:daily]).to be_an Hash
  end
end
