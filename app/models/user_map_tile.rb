class UserMapTile < ApplicationRecord
  belongs_to :user
  belongs_to :map_tile
end
