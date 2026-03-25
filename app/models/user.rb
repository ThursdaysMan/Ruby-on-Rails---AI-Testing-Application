class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_map_tiles
  has_many :map_tiles, through: :user_map_tiles
  has_many :user_layers
  has_many :maps
  has_many :alert_layers, dependent: :destroy

  VALID_API_FORMAT = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i

  validates :satellite_api_link,
    format: { with: VALID_API_FORMAT, message: "API Must be formatted xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"},
  allow_blank: true
end
