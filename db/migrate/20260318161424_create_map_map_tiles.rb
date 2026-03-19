class CreateMapMapTiles < ActiveRecord::Migration[7.2]
  def change
    create_table :map_map_tiles do |t|
      t.references :map, null: false, foreign_key: true
      t.references :map_tile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
