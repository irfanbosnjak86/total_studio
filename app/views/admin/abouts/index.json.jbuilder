json.array!(@abouts) do |admin_about|
  json.extract! admin_about, :id
  json.url admin_about_url(about, format: :json)
end
