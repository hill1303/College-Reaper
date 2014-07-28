class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      # Building name
      t.text :name

      # GPS coordinates, using RGeo and PostGIS
      t.point :lonlat, :geographic => true

      # Street address components
      t.text :street1
      t.text :street2
      t.text :city
      t.text :state
      t.text :zip 

      # Metadata field
      t.timestamps
    end

    # Spatial index on the coordinates
    add_index :locations, :lonlat, :spatial => true
  end

  def down
    remove_index :locations, 'index_on_location_location'
    drop_table :locations
  end
end
