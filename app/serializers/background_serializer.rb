class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_type :background
  attributes :image_url, :title
end
