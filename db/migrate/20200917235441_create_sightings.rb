class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.references :bird, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end

#rails g resource sighting bird:references location:references
#using references in the generator: add relationships automatically to the generated model 
#so it does:  class Sighting < ApplicationRecord (in the model folder)
# belongs_to :bird
  #belongs_to :location