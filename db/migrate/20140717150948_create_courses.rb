class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
        # Instructional unit 
        t.text :instrUnit

    	# Course identification number
    	t.text :courseNo

        # Descriptive name for course
        t.text :name

    	#Number of credit hours counted toward degree
    	t.text :creditHrs

        t.timestamps
    end
  end
end
