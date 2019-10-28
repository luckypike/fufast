json.product do
  json.partial! @product

  json.images @product.attachments.sort_by{ |i| i.id }

  json.products @products.includes(:attachments) do |product|
    json.partial! product
    json.image product.attachments.min_by(&:id)
  end

  # TODO: rewrite long string
  json.properties(@element_properties.group_by(&:property).sort_by { |property, _| property.sort }) do |property, properties|
    json.partial! property

    json.values properties, :id, :value, :property_id
  end
end
