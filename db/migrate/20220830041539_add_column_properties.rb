class AddColumnProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :nearest_station_id, :integer
  end
end
