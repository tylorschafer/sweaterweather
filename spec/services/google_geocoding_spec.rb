require 'rails_helper'

describe GoogleGeocoding do
  it 'Returns Lattitude and Longitude of a location' do
    result = GoogleGeocoding.coordinates('denver,co')

    expected_results = {
      'lat': 39.7392358,
      'lng': -104.990251
    }

    expect(result['data']).to eq(expected_results)
  end
end
