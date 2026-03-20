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
end
