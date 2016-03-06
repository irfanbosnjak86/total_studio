json.array!(@contacts) do |admin_contact|
  json.extract! admin_contact, :id
  json.url admin_contact_url(contact, format: :json)
end
