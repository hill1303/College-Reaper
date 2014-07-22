class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      # Instructional unit
      t.text :instructional_unit

      # Course identification number
      t.text :course_number

      # Descriptive name for course
      t.text :name

      # Number of credit hours counted toward degree
      t.text :credit_hours

      # Metadata field
      t.timestamps
    end
  end
end
