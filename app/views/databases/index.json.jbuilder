json.array!(@databases) do |database|
  json.extract! database, :id, :name
  json.url database_url(database, format: :json)
end
