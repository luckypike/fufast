json.extract! order, :id, :price
json.date l(order.created_at.to_date)
