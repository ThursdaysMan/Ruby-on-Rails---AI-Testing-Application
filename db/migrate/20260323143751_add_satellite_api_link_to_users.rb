class AddSatelliteApiLinkToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :satellite_api_link, :string
  end
end
