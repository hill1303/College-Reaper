class AddPersonToSections < ActiveRecord::Migration
  def change
  	   t.belongs_to :person

  end
end
