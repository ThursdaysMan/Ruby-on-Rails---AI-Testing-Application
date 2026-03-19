class MapsController < ApplicationController
    
    def index
        puts "****MAPSCONTROLLERRUNNING****"
        #@maps = Map.includes(:map_tiles, :user_layers).all
        if user_signed_in?
            @maps = current_user.maps.includes(:map_tiles, :user_layers)
        else
            osm_tile = MapTile.find_by(name: "OSM Standard")
            puts "osm_tile = #{osm_tile.inspect}" if defined?(osm_tile)
            guest_map = GuestMap.new(osm_tile)
            @maps = [guest_map]
            puts "@maps = #{@maps.inspect}"
        end
    end

end
