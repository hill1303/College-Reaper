class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      # Records a letter grade for each relationship
      t.text :grade, limit: 1, null: false, default: 'W'

      # Foreign key relationships
      t.belongs_to :user
      t.belongs_to :course
    end
  end
end
