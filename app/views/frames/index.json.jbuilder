json.array!(@frames) do |frame|
  json.extract! frame, :id, :names, :brand_id
  json.url frame_url(frame, format: :json)
end
