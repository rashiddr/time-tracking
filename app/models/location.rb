class Location < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	validates :place_id, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :time_zone, presence: true
	validates :place_name, presence: true
end
