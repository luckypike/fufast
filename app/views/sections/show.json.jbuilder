json.products @products do |product|
  json.partial! product
end

json.section do
  json.partial! @section
  json.image @section.image, :id, :path if @section.image && !@section.parent_section

  json.parent do
    json.partial! @section.parent_section if @section.parent_section
  end
end

json.sections @section.sections do |section|
  json.partial! section
end

json.siblings @section.siblings do |section|
  json.partial! section
end
