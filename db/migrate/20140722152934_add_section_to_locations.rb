class AddSectionToLocations < ActiveRecord::Migration
  def change
  	change_table :locations do |t|
  		# Add foreign key to sections table
  		t.belongs_to :section
  end
end
