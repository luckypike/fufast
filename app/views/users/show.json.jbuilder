json.orders @orders do |order|
  json.partial! order

  json.items order.items do |item|
    json.partial! item
  end
end
