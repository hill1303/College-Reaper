class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      # Mathematically determined score per course
      t.integer :score

      # Hstore course sub-scores
      t.hstore :sub_scores

      # Associations to other models
      t.belongs_to :user
      t.belongs_to :term

      # Metadata
      t.timestamps
    end
  end
end
