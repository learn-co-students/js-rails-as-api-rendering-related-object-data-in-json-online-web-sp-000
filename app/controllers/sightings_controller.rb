class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end
  
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: {
        id: sighting.id, bird: sighting.bird, location: sighting.location
      }
    else
      render json: {message: 'No sighting found with that id'}
    end
    # You can also configure the JSON response with 'include', as follows
    # render json: sighting, include: [:bird, :location], except: [:updated_at]
  end
end
