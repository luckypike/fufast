json.order do
  json.partial! @order

  json.items @order.items.includes(product: :attachments) do |item|
    json.partial! item
    json.product do
      json.partial! item.product
      json.image item.product.attachments.min_by(&:id)
    end
  end
end
