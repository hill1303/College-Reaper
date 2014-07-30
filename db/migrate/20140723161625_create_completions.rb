class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      # Record a grade for each relationship
      t.text :grade, limit: 2, null: false, default: 'I'

      # Foreign key relationships
      t.belongs_to :user
      t.belongs_to :course
    end
  end
end
