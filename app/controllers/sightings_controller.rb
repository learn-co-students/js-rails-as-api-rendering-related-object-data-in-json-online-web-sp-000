class SightingsController < ApplicationController
    def index
        sighting = Sighting.all
        render json: sighting.to_json(include: [:bird, :location], except: [:created_at, :updated_at])
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(:include => {
                :bird => {:only => [:name, :species]},
                :location => {:only => [:latitude, :longitude]}
              }, :except => [:created_at, :updated_at])
        else
            render json: { message: 'No sighting found with that id'}
        end
    end
end
