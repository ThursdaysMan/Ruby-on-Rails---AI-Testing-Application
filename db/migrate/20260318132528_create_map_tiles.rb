class CreateMapTiles < ActiveRecord::Migration[7.2]
  def change
    create_table :map_tiles do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end
