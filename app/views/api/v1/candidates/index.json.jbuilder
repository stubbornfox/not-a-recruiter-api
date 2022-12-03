json.array! @candidates do |candidate|
  json.(candidate, :id, :name)
end
