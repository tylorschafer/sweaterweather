class Photo
  attr_reader :id, :image_url, :title

  def initialize(resp = {})
    @id = rand(3..1000)
    @image_url = resp[:photo][:urls][:url][0][:_content]
    @title = resp[:photo][:title][:_content]
  end
end
