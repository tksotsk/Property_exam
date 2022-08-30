class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.string :name_of_railway
      t.string :station_name
      t.integer :how_many_minites_walk

      t.timestamps
    end
  end
end
