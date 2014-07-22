class CreateCourseGroups < ActiveRecord::Migration
  def change
    create_table :course_groups do |t|
      # Course attributes
      t.text :name
      t.boolean :college_global
      t.boolean :college_independent

      # Metadata
      t.timestamp
    end
  end
end
