class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    sighting = Sighting.find_by(id: params[:id])
  render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
  end
end