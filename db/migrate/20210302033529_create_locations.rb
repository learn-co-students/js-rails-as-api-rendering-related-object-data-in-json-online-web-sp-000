class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
# rails g model location latitude:float longitude:float