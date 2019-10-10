json.extract! product, :id, :title, :description, :price

json.prices product.prices do |price|
  json.partial! price
end
