class AddTermToSections < ActiveRecord::Migration
  def change
  	 change_table :sections do |t|
      # Add foreign key to the :term table
      t.belongs_to :term
    end
  end
end
