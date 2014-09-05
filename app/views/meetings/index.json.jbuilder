json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :user_id, :description
  json.url meeting_url(meeting, format: :json)
end
