class MapTile < ApplicationRecord
    has_many :map_map_tiles
    has_many :users, through: :map_map_tiles
end
