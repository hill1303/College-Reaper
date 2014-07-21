class AddLocationToSections < ActiveRecord::Migration
  def change
  	   t.belongs_to :location

  end
end
