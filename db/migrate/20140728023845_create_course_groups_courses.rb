class CreateCourseGroupsCourses < ActiveRecord::Migration
  def change
    create_table :course_groups_courses, id: false do |t|
      # Relate Course and CourseGroup objects
      t.belongs_to :course
      t.belongs_to :course_group
    end
  end
end
