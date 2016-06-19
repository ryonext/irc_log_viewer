json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :channel, :references, :text, :published_at
  json.url message_url(message, format: :json)
end
