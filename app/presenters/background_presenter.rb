class BackgroundPresenter
  def self.to_json(photos)
    new.serialized_json(photos)
  end

  def serialized_json(photos)
    {
      data: serialized_photos(photos)
    }.to_json
  end

  def serialized_photos(photos)
    photos.map do |photo|
      {image_url: photo.image_url, title: photo.title}
    end
  end
end
