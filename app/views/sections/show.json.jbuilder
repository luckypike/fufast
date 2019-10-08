json.sections @sections do |section|
  json.partial! section
  json.products section.products.futured do |propduct|
    json.partial! propduct
  end
end

json.products @products do |product|
  json.partial! product
end

json.properties @primary_section.properties do |property|
  json.partial! property
end
