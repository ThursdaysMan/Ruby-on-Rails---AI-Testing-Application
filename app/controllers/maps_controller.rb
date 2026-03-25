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

    def show_alert_list
        if user_signed_in?
            @maps = current_user.maps.includes(:map_tiles, :user_layers)
            @alert_layers = current_user.alert_layers

            render partial: 'shared/alertdisplaysection', layout: false
        else
            render partial: 'shared/haveyouconsideredcreatinganaccount', layout: false
        end

    end

    def show_notification_list
        if user_signed_in?
            @maps = current_user.maps.includes(:map_tiles, :user_layers)

            render partial: 'shared/notificationdisplaysection', layout: false
        else
            render partial: 'shared/haveyouconsideredcreatinganaccount', layout: false
        end

    end

    def satellite_ingest_settings
        if user_signed_in?
            @user = current_user
        end
    end

    def user_params
        params.require(:user).permit(:satellite_api_link)
    end
    
    def update_settings
        if user_signed_in?
            @user = current_user
            if @user.update(user_params)
                flash.now[:notice] = "Settings Updated"
                render :satelliteingestsettings
            else
                flash.now[:error] = "Settings Not Updated - Please Check Your API"
                render :satelliteingestsettings, status: :unprocessable_entity
            end
        end
    end
end
