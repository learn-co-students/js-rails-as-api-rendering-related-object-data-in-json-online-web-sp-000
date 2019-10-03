class SightingsController < ApplicationController
    def index
        @sightings = Sighting.all 
        render json: @sightings.to_json(:include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]}
        }, :except => [:created_at, :updated_at])
    end

    def show
        if find_sighting
            render json: @sighting.to_json(:include => {
                :bird => {:only => [:name, :species]},
                :location => {:only => [:latitude, :longitude]}
            }, :except => [:created_at, :updated_at])
        else  
            render json: {message: 'Sighting not found'}
        end
    end

    private

    def find_sighting
        @sighting = Sighting.find_by(id:params[:id])
    end
end
