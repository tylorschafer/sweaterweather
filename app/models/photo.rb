class Photo
  attr_reader :image_url, :title

  def initialize(resp = {})
    @image_url = resp[:photo][:urls][:url][0][:_content]
    @title = resp[:photo][:title][:_content]
  end
end
