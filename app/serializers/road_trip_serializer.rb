class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_type :road_trip
  attributes :distance, :duration, :weather_summary
end
