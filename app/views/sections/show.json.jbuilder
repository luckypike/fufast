json.sections @sections do |section|
  json.partial! section
  json.products section.products.futured do |product|
    json.partial! product

    json.image product.attachments.first
  end
end

json.products @products do |product|
  json.partial! product

  json.image product.attachments.first
end

json.properties @primary_section.properties do |property|
  json.partial! property
end
