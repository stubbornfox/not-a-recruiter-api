if @candidate.valid?
  json.partial! @candidate, as: :candidate
else
  json.errors @candidate.errors
end
