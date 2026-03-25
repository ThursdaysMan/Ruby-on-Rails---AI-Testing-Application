class Map < ApplicationRecord
  belongs_to :user
  has_many :map_map_tiles
  has_many :map_tiles, through: :map_map_tiles
  
  has_many :user_layers, dependent: :destroy
end
