class CreateCoursesRequirementGroups < ActiveRecord::Migration
  def change
    create_table :courses_requirement_groups, :id => false do |t|
      # Associations to Course and RequirementGroup
      t.belongs_to :course
      t.belongs_to :requirement_group
    end
  end
end
