class CreateFlaps < ActiveRecord::Migration[5.2]
  def change
    create_table :flaps do |t|

      t.timestamps
    end
  end
end
