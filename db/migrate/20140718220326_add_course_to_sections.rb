class AddCourseToSections < ActiveRecord::Migration
  def change
    change_table :sections do |t|
      # Add foreign key to the :courses table
      t.belongs_to :course
    end
  end
end
