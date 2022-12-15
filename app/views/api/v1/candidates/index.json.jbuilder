json.array! @candidates do |candidate|
  json.call(candidate, :id, :name)
end
