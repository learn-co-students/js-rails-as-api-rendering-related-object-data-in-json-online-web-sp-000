class SightingsController < ApplicationController
    def show 
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting 
        # render json: {
        #     id: sighting.id, 
        #     bird: sighting.bird, 
        #     location: sighting.location 
        # }
        if sighting 
            # render json: sighting, include: [:bird, :location], except: [:updated_at]
            # specify which fields are shown in the nested resources 
            render json: sighting.to_json(
                :include => {
                    :bird => {:only => [:name, :species]},
                    :location => {:only => [:latitude, :longitude]}
                }, 
                :except => [:updated_at]
            )
        else 
            render json: {
                message: 'No sighting was found with that id'
            }
        end 
    end 

    def index 
        sightings = Sighting.all 
        render json: sightings, include: [:bird, :location], except: [:created_at, :updated_at]
    end 
end
