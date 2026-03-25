# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

default_map_type = 0
copernicus_map_type = 1

example_api = "3bd028f5-ab9f-4903-98ec-11d3be37e547"

dummy = User.find_or_create_by!(email: 'example@example.com', satellite_api_link: example_api) do |u|
    u.password = "password"
end



#Map 1 - Default
map = Map.find_or_create_by!(name: "Default Map", user: dummy)

osm_tile = MapTile.find_or_create_by!(name: "OSM Standard", tile_type: default_map_type) do |t|
    t.data = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
end

MapMapTile.find_or_create_by!(map: map, map_tile: osm_tile)

#Map 2 - Testing Map
map2 = Map.find_or_create_by!(name: "OpenTopoMap", user: dummy)

otm_tile = MapTile.find_or_create_by!(name: "OTM Standard", tile_type: default_map_type) do |t|
    t.data = "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png"
end

MapMapTile.find_or_create_by!(map: map2, map_tile: otm_tile)

#Map 3 - Copernicus Map
map3 = Map.find_or_create_by!(name: "Copernicus Map", user: dummy)

copernicus_tile = MapTile.find_or_create_by!(name: "Copernicus Test", tile_type: copernicus_map_type) do |t|
    t.data = "https://sh.dataspace.copernicus.eu/ogc/wms/"
end

MapMapTile.find_or_create_by!(map: map3, map_tile: copernicus_tile)

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