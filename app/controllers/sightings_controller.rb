class SightingsController < ApplicationController
	def show
	  sighting = Sighting.find_by(id: params[:id])
	  render json: sighting, include: {
	    bird: {:only => [:name, :species]},
	    location: {:only => [:latitude, :longitude]}
	  }, except: [:updated_at]
	end
end
