class CreateUserLayers < ActiveRecord::Migration[7.2]
  def change
    create_table :user_layers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :geojson_data

      t.timestamps
    end
  end
end
