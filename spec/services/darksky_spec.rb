require 'rails_helper'

describe Darksky do
  it 'returns forecast data for an address' do
    service = Darksky.new('denver,co')

    results = service.json_response

    expect(json_response).to be_a Hash
    expect(json_response[:currently]).to be_a Hash
    expect(json_response[:currently][:temperature]).to be_a Float
    expect(json_response[:currently][:summary]).to be_a String
    expect(json_response[:minutely]).to be_a Hash
    expect(json_response[:datily]).to be_an Array
  end
end
