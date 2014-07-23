class CreateRequirementGroups < ActiveRecord::Migration
  def change
    create_table :requirement_groups do |t|
      # A descriptive name for the RequirementGroup
      t.text :name
      
      # A rule that corresponds to a stored procedure for completion checks
      t.text :rule

      # Metadata
      t.timestamp
    end
  end
end
