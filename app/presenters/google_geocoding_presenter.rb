class GoogleGeocodingPresenter
  def self.format_data(data)
    new.format(data)
  end

  def format(data)
    formatted_resp = {}
    formatted_resp[:data] = data[:results][0][:geometry][:location]
    formatted_resp
  end
end
