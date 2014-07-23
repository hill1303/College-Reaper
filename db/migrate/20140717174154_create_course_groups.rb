class CreateCourseGroups < ActiveRecord::Migration
  def change
    create_table :course_groups do |t|
      # Course attributes
      t.text :name, null: false, default: ''
      t.boolean :college_global, null: false, default: false
      t.boolean :college_independent, null: false, default: false

      # Association to a College
      t.belongs_to :college

      # Metadata
      t.timestamp
    end

    add_index :course_groups, :name, unique: true
  end
end
