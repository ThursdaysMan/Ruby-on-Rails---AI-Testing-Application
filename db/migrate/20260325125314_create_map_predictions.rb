class CreateMapPredictions < ActiveRecord::Migration[7.2]
  def change
    create_table :map_predictions do |t|
      t.references :map, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.jsonb :geojson_data
      t.datetime :processed_at
      t.string :ai_model_version

      t.timestamps
    end
  end
end
