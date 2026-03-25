class CreateAlertLayers < ActiveRecord::Migration[7.2]
    def change
        create_table :alert_layers do |t|
            t.string :name, null: false
            t.text :geojson_data, null: false
            t.bigint :user_id, null: false
            t.timestamps
        end

        add_index :alert_layers, :user_id
        add_foreign_key :alert_layers, :users
    end
end
