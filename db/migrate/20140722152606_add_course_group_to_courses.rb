class AddCourseGroupToCourses < ActiveRecord::Migration
  def change
      change_table :courses do |t|
        # Add foreign key to course_group table
        t.belongs_to :course_group
      end
  end
end
