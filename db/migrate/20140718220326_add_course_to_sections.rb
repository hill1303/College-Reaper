class AddCourseToSections < ActiveRecord::Migration
  def change
  		#Add foreign key to the sections table
  	    t.belongs_to :course

  end
end
