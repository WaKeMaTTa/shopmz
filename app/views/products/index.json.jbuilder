json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :date_created, :manufacturer, :quantity
  json.url product_url(product, format: :json)
end
