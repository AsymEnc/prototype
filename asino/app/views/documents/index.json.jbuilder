json.array!(@documents) do |document|
  json.extract! document, :id, :id, :title, :fulltext, :date, :location
  json.url document_url(document, format: :json)
end
