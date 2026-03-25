class GuestMap
    attr_reader :name, :map_tiles, :user_layers

    def initialize(tile)
        @name = "OpenStreetMap"
        @map_tiles = tile ? [tile] : []
        @user_layers = []
    end
end