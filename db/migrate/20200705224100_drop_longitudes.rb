class DropLongitudes < ActiveRecord::Migration[5.2]
  def change
    drop_table :longitudes
  end
end
