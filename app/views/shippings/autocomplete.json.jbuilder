json.array! @shippings do |shipping|
  json.keyword shipping.order.product_name
end