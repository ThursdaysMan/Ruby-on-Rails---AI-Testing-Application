class AddTypeToMapTiles < ActiveRecord::Migration[7.2]
  def change
    add_column :map_tiles, :tile_type, :integer
  end
end
