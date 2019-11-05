class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  attributes :current, :next_8_hrs, :next_5_days
end
