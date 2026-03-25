class CopernicusCheckJob < ApplicationJob
  queue_as :default

  def perform
    User.where.not(satellite_api_link: nil).find_each do |user|

      aoi_wkt = user.map_tiles.first&.data # Simplified: using the first tile as anchor
      next unless aoi_wkt

      #Get Copernicus Query
      start_date = 1.day.ago.iso8601
      url = "https://catalogue.dataspace.copernicus.eu/odata/v1/Products"
      query = "$filter=contains(Name,'S2GLC') and ContentDate/Start gt #{start_date} and OData.CSC.Intersects(area=geography'SRID=4326;#{aoi_wkt}')"
      
      response = HTTParty.get("#{url}?#{query}")
      next unless response.success?

      products = JSON.parse(response.body)["value"]

      products.each do |product|
        #Duplicate checker
        next if Map.exists?(external_id: product["Id"])

        #Create Map record linked to the user
        new_map = user.maps.create!(
          name: product["Name"],
          external_id: product["Id"], # You'll need to add this column to 'maps'
          download_url: product["@odata.mediaReadLink"]
        )

        #TO BE IMPLEMENTED
        #CopernicusProcessorJob.perform_later(user.id, {
        #  map_id: new_map.id,
        #  url: new_map.download_url
        #})
      end
    end
  end
end
