require 'rails_helper'

describe Amypode do
  it 'It returns the antipode lat and long of supplied coordinates' do
    amy = Amypode.new(27, -0.82)

    results = amy.find_antipode

    expect(results).to be_a Hash
    expect(results[:data]).to be_a Hash
    expect(results[:data][:id]).to be_a String
    expect(results[:data][:attributes]).to be_a Hash
    expect(results[:data][:attributes][:lat]).to be_a Float
    expect(results[:data][:attributes][:long]).to be_a Float
  end
end
