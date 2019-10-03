json.extract! product_property, :id, :title
json.enum product_property.enum do |enum|
  json.extract! enum, :id, :value
end

json.items product_property.enum do |item|
  json.extract! item, :id, :value
end
