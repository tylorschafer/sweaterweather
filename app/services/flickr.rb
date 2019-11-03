class Flickr
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def photo_finder
    params = {
      tags: location,
      method: 'flickr.photos.search'
    }
    response = conn(params)
    json_response(response)
  end

  def find_photo(id)
    params = {
      photo_id: id,
      method: 'flickr.photos.getInfo'
    }
    response = conn(params)
    json_response(response)
  end

  def returned_photos
    photo_finder[:photos][:photo].map do |photo|
      Photo.new(find_photo(photo[:id]))
    end
  end

  private

  def json_response(response)
    JSON.parse(response.body[14..-2], symbolize_names: true)
      .reject {}
  end

  def conn(params)
    Faraday.get('https://api.flickr.com/services/rest/') do |f|
      f.params = {
        api_key: ENV['FLICKR_API_KEY'],
        format: 'json',
      }.merge!(params)
    end
  end
end
