class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      # Mathematically determined score per course
      t.integer :score

      # Hstore course sub-scores
      t.hstore :sub_scores

      # Metadata
      t.timestamps
    end
  end
end