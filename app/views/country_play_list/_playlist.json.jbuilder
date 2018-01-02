json.extract! playlist, :id, :score, :year, :created_at, :updated_at

json.country playlist.country.name
json.track do
  json.author playlist.track.author.name
  json.extract! playlist.track, :name, :cover, :link
end

