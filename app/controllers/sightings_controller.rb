class SightingController < ApplicationController
  sighting = Sighting.find_by(id: params[:id])
  if sighting
    render json: sighting, include: [:bird, :location], except: [:updated_at]
  else
    render json: { message: 'No sighting found with that id' }
  end
end
