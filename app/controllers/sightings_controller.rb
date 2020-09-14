class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by_id(params[:id])
    # render json: sighting
    # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    render json: sighting, include: {
      bird: { only: [:name, :species] },
      location: { only: [:latitude, :longitude] }
    }, only: [:id, :created_at]
  end
end
