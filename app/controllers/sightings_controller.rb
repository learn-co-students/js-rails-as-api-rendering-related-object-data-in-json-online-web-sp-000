class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

    end

    def index
      sightings = Sighting.all
      if sighting
        render json: sightings, include: [:bird, :location]
      else
        render json: { message: 'No sighting found with that id' }
      end
    end
    
end
