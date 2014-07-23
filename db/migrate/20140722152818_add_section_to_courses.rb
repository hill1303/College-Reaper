class AddSectionToCourses < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      # Add foreign key to terms table
      t.belongs_to :section
    end
  end
end
