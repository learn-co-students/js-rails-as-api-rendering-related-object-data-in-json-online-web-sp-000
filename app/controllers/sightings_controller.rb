class SightingsController < ApplicationController

  def index
  sightings = Sighting.all
  render json: sightings.to_json(include: [:bird, :location])

  # to_json =  Returns a JSON string representing the hash.
  end



  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
    render json: sighting.to_json(:include => {
    :bird => {:only => [:name, :species]},
    :location => {:only => [:latitude, :longitude]}
  }, :except => [:updated_at])
    else
      render json: { message: 'No sighting found with that id' }
    end

    # to_json =  Returns a JSON string representing the hash.


    # { id: sighting.id, bird: sighting.bird, location: sighting.location }

    # but instead we use include for simpler convention, produces same thing

  end

  # within the show action we set sighting as varibale to display
  # other specific areas that link a sighting_id  where bird_id and location_id match up.
  # Then we try to render or display that data in JSON format.

  # render json -> id: sighting.id
   # -------- links this specific model_id
   # bird:sighting.bird
    # ------- displays the specific bird_id at this sighting
    # location: sighting.location
    # ---- displays the specific location_id at this sighting
  # --------------- See Below -----------------


  #  WHy is this useful?

#
# {
#   "id": 1, -> sighting_id
#   "bird_id": 9, -> bird_id
#   "location_id": 2, -> location_id

#   "created_at": "2020-05-31T14:30:02.507Z",
#   "updated_at": "2020-05-31T14:30:02.507Z"
# }

# #
# {
#   "id": 1,
#   "bird": {
#     "id": 9,
#     "name": "Black-Capped Chickadee",
#     "species": "Poecile Atricapillus",
#     "created_at": "2020-05-31T14:30:02.413Z",
#     "updated_at": "2020-05-31T14:30:02.413Z"
#   },

#
#   "location": {
#     "id": 2,
#     "latitude": 30.26715,
#     "longitude": -97.74306,
#     "created_at": "2020-05-31T14:30:02.466Z",
#     "updated_at": "2020-05-31T14:30:02.466Z"
#   }
# }

end
