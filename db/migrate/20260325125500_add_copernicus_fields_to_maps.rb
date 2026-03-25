class AddCopernicusFieldsToMaps < ActiveRecord::Migration[7.2]
  def change
    add_column :maps, :external_id, :string
    add_index :maps, :external_id
    add_column :maps, :download_url, :string
  end
end
