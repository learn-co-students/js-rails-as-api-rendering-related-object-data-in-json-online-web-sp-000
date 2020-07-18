class Location < ApplicationRecord
  has_many :birds
  has_many :locations, through: :sightings
end
