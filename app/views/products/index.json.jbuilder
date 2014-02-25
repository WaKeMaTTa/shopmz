json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :registred_at, :manufacturer, :quantity
  json.url product_url(product, format: :json)
end
