class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      # Building name
      t.text :name

      # GPS coordinates
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6

      #Street address
      t.text :street1
      t.text :street2
      t.text :city
      t.text :state
      t.text :zip      
    execute %{
      create index index_on_location_location ON locations using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || locations.logitude || ' ' || locations.latitude || ')
        )
      )
    }
  end

  def down
    remove_index :locations, 'index_on_location_location'
    drop_table :locations
  end
end
