json.array!(@uploads) do |upload|
  json.extract! upload, :id, :file, :mailid
  json.url upload_url(upload, format: :json)
end
