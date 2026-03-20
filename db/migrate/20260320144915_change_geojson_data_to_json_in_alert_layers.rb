class ChangeGeojsonDataToJsonInAlertLayers < ActiveRecord::Migration[7.2]
  def up
    change_column :alert_layers, :geojson_data, :jsonb, using: 'geojson_data::jsonb'
  end
  def down
    change_column :alert_layers, :geojson_data, :text, using: 'geojson_data::text'
  end
end
