class SightingsController < ApplicationController

   def index
      sightings = Sighting.all
      render json: sightings, include: [:bird, :location]
   end

   def show
      sighting = Sighting.find_by(id: params[:id])
      # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
      # render json: sighting, include: [:bird, :location]

      # 'include' is a Rails macro that abstracts/obscure .to_json()
      # and adds error handling.

      # render json: sightings.to_json(include: [:bird, :location]
      # if sighting
      #    render json: sighting.to_json(include: [:bird, :location])
      # else
      #    render json: { message: 'No sighting found with that id' }
      # end

      # a moore specific data approach:
      render json: sighting.to_json(:include => {
         :bird => {:only => [:name, :species]},
         :location => {:only => [:latitude, :longitude]}
      }, :except => [:updated_at])
   end

end
