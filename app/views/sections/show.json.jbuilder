json.sections @sections do |section|
  json.cache! section, expires_in: 10.minutes do
    json.partial! section
    json.products Product.futured(section) do |product|
      json.partial! product

      json.image product.attachments.min_by(&:id)
    end
  end
end

json.products @products do |product|
  json.partial! product

  json.image product.attachments.min_by(&:id)
end

json.properties @primary_section.properties do |property|
  json.partial! property
end
