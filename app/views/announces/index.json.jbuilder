json.array!(@announces) do |announce|
  json.extract! announce, :id, :title, :content
  json.url announce_url(announce, format: :json)
end
