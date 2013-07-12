json.array!(@users) do |user|
  json.extract! user, :name, :mobile, :twitter_handle, :company
  json.url user_url(user, format: :json)
end
