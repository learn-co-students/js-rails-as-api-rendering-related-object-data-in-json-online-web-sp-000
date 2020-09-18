class SightingsController < ApplicationController

    #right now it is rendering the seed data and that is what we see when we go to localhost/sightings/1
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
          render json: sighting.to_json(include: [:bird, :location])
        else
          render json: { message: 'No sighting found with that id' }
        end
      end

  def index
    sightings = Sighting.all
    render json: sightings.to_json(include: [:bird, :location])
  end

end 


#Using include
#An alternative is to use the include option to indicate what models you want to nest:

#def show
#  sighting = Sighting.find_by(id: params[:id])
 # render json: sighting, include: [:bird, :location]
#end