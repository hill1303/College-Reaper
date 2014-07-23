class CreateRequirementGroups < ActiveRecord::Migration
  def change
    create_table :requirement_groups do |t|
      # A descriptive name for the RequirementGroup
      t.text :name, null: false, default: ''

      # A rule that corresponds to a stored procedure for completion checks
      t.text :rule, null: false, default: ''

      # Polymorphic relation to owning CourseGroup or Course
      t.references :owner, polymorphic: true

      # Metadata
      t.timestamp
    end
  end
end
