json.array!(@locations) do |location|
  json.extract! location, :name, :address, :longitude, :latitude, :gmaps, :oglas
  json.url location_url(location, format: :json)
end