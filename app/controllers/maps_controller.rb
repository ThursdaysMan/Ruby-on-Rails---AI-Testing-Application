class MapsController < ApplicationController
    
    def index
        puts "****MAPSCONTROLLERRUNNING****"
        #@maps = Map.includes(:map_tiles, :user_layers).all
        if user_signed_in?
            @maps = current_user.maps.includes(:map_tiles, :user_layers)
            @alert_layers = current_user.alert_layers
        else
            osm_tile = MapTile.find_by(name: "OSM Standard")
            #puts "osm_tile = #{osm_tile.inspect}" if defined?(osm_tile)
            guest_map = GuestMap.new(osm_tile)
            @maps = [guest_map]
            #puts "@maps = #{@maps.inspect}"
        end
    end

    def update_alert_map
        if user_signed_in?
            @maps = current_user.maps.includes(:map_tiles, :user_layers)
            @alert_layers = current_user.alert_layers
            
            render partial: 'shared/mapboxalerteditdynamic', layout: false
        else
            osm_tile = MapTile.find_by(name: "OSM Standard")
            #puts "osm_tile = #{osm_tile.inspect}" if defined?(osm_tile)
            guest_map = GuestMap.new(osm_tile)
            @maps = [guest_map]
            
            render partial: 'shared/mapboxdynamic', layout: false
        end
    end

    def show_base_map
        if user_signed_in?
            @maps = current_user.maps.includes(:map_tiles, :user_layers)
            @alert_layers = current_user.alert_layers

            render partial: 'shared/mapboxdynamic', layout: false
        else
            osm_tile = MapTile.find_by(name: "OSM Standard")
            #puts "osm_tile = #{osm_tile.inspect}" if defined?(osm_tile)
            guest_map = GuestMap.new(osm_tile)
            @maps = [guest_map]
            
            render partial: 'shared/mapboxdynamic', layout: false
        end
    end
end
