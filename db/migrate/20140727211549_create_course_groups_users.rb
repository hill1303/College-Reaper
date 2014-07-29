class CreateCourseGroupsUsers < ActiveRecord::Migration
  def change
    create_table :course_groups_users, id: false do |t|
      # Relates User and CourseGroup
      t.belongs_to :course_group
      t.belongs_to :user
    end
  end
end
