class FlickrService
  def self.get_photos(location)
    new.returned_photos(location)
  end

  def find_photos(location)
    params = { tags: location, method: 'flickr.photos.search' }
    response = conn(params)
    json_response(response)
  end

  def find_photo(id)
    params = { photo_id: id, method: 'flickr.photos.getInfo' }
    response = conn(params)
    json_response(response)
  end

  def returned_photos(location)
    find_photos(location)[:photos][:photo].first(10).map do |photo|
      find_photo(photo[:id])
    end
  end

  private

  def json_response(response)
    JSON.parse(response.body[14..-2], symbolize_names: true)
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
