json.array!(@notifications) do |notification|
  json.extract! notification, 
  json.url notification_url(notification, format: :json)
end