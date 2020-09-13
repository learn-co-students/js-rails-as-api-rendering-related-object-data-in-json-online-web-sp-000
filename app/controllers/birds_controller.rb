class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: sightings, include: [:bird, :location]
  end

  def show
  sighting = Sighting.find_by(id: params[:id])
  render json: sighting.to_json(include: [:bird, :location])
end
end