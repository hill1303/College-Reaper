class AddLocationToSections < ActiveRecord::Migration
  def change
    change_table :sections do |t|
      # Add foreign key to the :locations table
      t.belongs_to :location
    end
  end
end
