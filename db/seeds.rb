# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

dummy = User.find_or_create_by!(email: 'example@example.com') do |u|
    u.password = "password"
end

#Map 1 - Default
map = Map.find_or_create_by!(name: "Default Map", user: dummy)

osm_tile = MapTile.find_or_create_by!(name: "OSM Standard") do |t|
    t.data = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
end

MapMapTile.find_or_create_by!(map: map, map_tile: osm_tile)

#Map 2 - Testing Map
map2 = Map.find_or_create_by!(name: "OpenTopoMap", user: dummy)

otm_tile = MapTile.find_or_create_by!(name: "OTM Standard") do |t|
    t.data = "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png"
end

MapMapTile.find_or_create_by!(map: map2, map_tile: otm_tile)

#GeoJson Test
geojson_file = Rails.root.join("test/fixtures/files/example.geojson")
geojson_data = File.read(geojson_file)

UserLayer.find_or_create_by!(
    map: map2,
    user: dummy,
    name: "Example GeoJson Overlay",
    geojson_data: geojson_data
)

geojson_file2 = Rails.root.join("test/fixtures/files/example2.geojson")
geojson_data2 = File.read(geojson_file2)

UserLayer.find_or_create_by!(
    map: map2,
    user: dummy,
    name: "Example 2 GeoJson Overlay",
    geojson_data: geojson_data2
)