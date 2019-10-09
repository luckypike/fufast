json.extract! product_property, :id, :title, :type
json.enum product_property.enum do |enum|
  json.extract! enum, :id, :value
end

json.items product_property.enum do |item|
  json.extract! item, :id, :value
end

json.labels product_property.enum.map { |e| [e.id, e.value] }.to_h
