class BackgroundsFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def photos
      photo_data = FlickrService.get_photos(location)
      photos = photo_data.map do |photo|
        Photo.new(photo)
      end
      photos
  end
end
