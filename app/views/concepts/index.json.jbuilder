json.array!(@concepts) do |concept|
  json.extract! concept, :id, :name, :definition
  json.url concept_url(concept, format: :json)
end
