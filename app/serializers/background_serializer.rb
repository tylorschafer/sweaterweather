class BackgroundSerializer
  attr_reader :photos

  def initialize(photos)
    @photos = photos
  end

  def serialized_json
    {
      data: serialize_photos
    }.to_json
  end

  def serialize_photos
    photos.map do |photo|
      {image_url: photo.image_url, title: photo.title}
    end
  end
end
