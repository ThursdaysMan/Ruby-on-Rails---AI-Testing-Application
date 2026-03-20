class AlertLayersController < ApplicationController
    before_action :authenticate_user!

    def create
        @alert_layer = current_user.alert_layers.new(alert_layer_params)
        if @alert_layer.save
            render json: @alert_layer, status: :creted
        else
            render json: { errors: @alert_layer.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        @alert_layer = current_user.alert_layers.find(params[:id])
        if @alert_layer.update(alert_layer_params)
            render json: @alert_layer
        else
            render json: { errors: @alert_layer.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def destroy
        layer = current_user.alert_layers.find(params[:id])
        layer.destroy
        head :ok
    end

    def alert_layer_params
        params.require(:alert_layer).permit(:name, geojson_data: {})
    end
end