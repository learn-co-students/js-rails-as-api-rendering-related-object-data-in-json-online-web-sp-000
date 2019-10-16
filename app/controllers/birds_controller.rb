class BirdsController < ApplicationController
  # def index
  #   @birds = Bird.all
  #   render json: @birds
  # end

    def index
  sightings = Sighting.all
  render json: sightings.to_json(include: [:bird, :location])
  end
 
end

