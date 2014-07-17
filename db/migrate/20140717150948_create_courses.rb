class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	#Course identification number
    	t.text :courseNo

    	#Instructional unit 
    	t.text :instrUnit

    	#Number of credit hours counted toward degree
    	t.text :creditHours
    end
  end
end
