class BackgroundsFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def photos
      service = FlickrService.new(location)
      photos = service.returned_photos.map do |photo|
        Photo.new(photo)
      end
      photos
  end
end
