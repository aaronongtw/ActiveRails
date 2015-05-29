json.array!(@fields) do |field|
  json.extract! field, :id, :name, :type, :table_id
  json.url field_url(field, format: :json)
end
