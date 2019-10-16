json.items @items do |item|
  json.partial! item
  json.product do
    json.partial! item.product
    json.image item.product.attachments.min_by(&:id)
  end
end
