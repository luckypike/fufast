json.products @products do |product|
  json.partial! product
end

json.section do
  json.partial! @section
end

json.sections @section.sections do |section|
  json.partial! section
end

json.parent do
  json.partial! @section.parent_section if @section.parent_section
end
