json.array!(@table_relations) do |table_relation|
  json.extract! table_relation, :id, :table_origin, :relationship, :through, :table_to
  json.url table_relation_url(table_relation, format: :json)
end
