json.section do
  json.partial! @section
  json.image @section.image, :id, :path if @section.image && !@section.parent_section

  json.parent do
    json.partial! @section.parent_section if @section.parent_section
  end

  json.primary do
    json.partial! @primary_section
  end

  json.secondary do
    json.partial! @secondary_section if @secondary_section
  end

  json.subs @subs do |section|
    json.partial! section
  end
end

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
