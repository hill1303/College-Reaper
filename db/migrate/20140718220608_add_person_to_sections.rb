class AddPersonToSections < ActiveRecord::Migration
  def change
    change_table :sections do |t|
      # Add foreign key to the :people table
      t.belongs_to :person
    end
  end
end
