json.array!(@orders) do |order|
  json.extract! order, :id, :status, :payment_method, :delivery_address, :delivery_city, :customer_name
  json.url order_url(order, format: :json)
end
