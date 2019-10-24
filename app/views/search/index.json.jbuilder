json.results @results do |result|
  json.partial! result
  json.image result.attachments.min_by(&:id)
end
