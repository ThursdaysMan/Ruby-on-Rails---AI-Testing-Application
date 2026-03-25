class AlertLayer < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :geojson_data, presence: true
end