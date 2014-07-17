class CreateCourseGroups < ActiveRecord::Migration
  def change
    create_table :course_groups do |t|
    	# Course name
    	t.text :name
    	
    	# If the course is versitile to other Colleges
    	t.boolean :college_global
    	
    	# If the course can be used as a minor or on its own
    	t.boolean :college_independent_flag

		# Metadata
    	t.timestamp
    end
  end
end
