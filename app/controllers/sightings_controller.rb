class SightingsController < ApplicationController

    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting
    #   end

    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    #   end

    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting, include: [:bird, :location]
      end

end
