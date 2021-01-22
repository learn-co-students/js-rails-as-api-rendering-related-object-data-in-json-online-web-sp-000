class Location < ApplicationRecord
  ApplicationRecord
  has_many :sightings
  has_many :birds, through: :sightings
end
