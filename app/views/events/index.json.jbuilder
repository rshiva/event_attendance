json.array!(@events) do |event|
  json.extract! event, :event_name, :user_id
  json.url event_url(event, format: :json)
end
