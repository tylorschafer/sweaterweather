require 'rails_helper'
require_relative 'dummy_flickr_response'

describe Photo do
  it 'exists' do
    dummy_response = File.read('spec/models/dummy_flickr_response.rb')
    results = JSON.parse(dummy_response, symbolize_names: true)
    photo = Photo.new(results)

    expect(photo).to be_a Photo
    expect(photo.title).to eq("Santa Cruz de Tenerife skyline")
    expect(photo.image_url)
      .to eq("https:\/\/www.flickr.com\/photos\/henryksadura\/49008133658\/")
  end
end
