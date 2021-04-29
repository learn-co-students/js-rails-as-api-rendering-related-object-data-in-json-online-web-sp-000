class SightingsController < ApplicationController
def show 
    
    sighting = Sighting.find_by(id: params[:id])
    if sighting 
    render json: sightings, include: [:bird, :location]
    else 
        render json: { message: 'No sighting found with that id'}
    end  
end
