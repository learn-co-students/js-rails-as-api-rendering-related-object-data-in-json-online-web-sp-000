class SightingsController < ApplicationController
#     def show
#   sighting = Sighting.find_by(id: params[:id])
#   render json: sighting
#     end

#     def show
#   sighting = Sighting.find_by(id: params[:id])
#   render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
#     end

#     def show
#   sighting = Sighting.find_by(id: params[:id])
#   render json: sighting, include: [:bird, :location]
#     end

#         def show
#   sighting = Sighting.find_by(id: params[:id])
#   render json: sighting.to_json(include: [:bird, :location])
#     end


#         def show
#   sighting = Sighting.find_by(id: params[:id])
#   if sighting
#     render json: sighting.to_json(include: [:bird, :location])
#   else
#     render json: { message: 'No sighting found with that id' }
#         end
#     end

#     def show
#   sighting = Sighting.find_by(id: params[:id])
#   render json: sighting, include: [:bird, :location], except: [:updated_at]
#     end


        def show
  sighting = Sighting.find_by(id: params[:id])
  render json: sighting.to_json(:include => {
    :bird => {:only => [:name, :species]},
    :location => {:only => [:latitude, :longitude]}
  }, :except => [:updated_at])
 end

end
