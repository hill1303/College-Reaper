class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|

		# General section info
    	t.string :room
    	t.time :start_time
    	t.time :end_time
    	t.string :rpt_pattern

		# Section availability info
    	t.boolean :open_flag
    	t.integer :course_seats
    	t.integer :wait_seats
    	t.integer :seat_max
    	t.integer :wait_max

		# Metadata field
    	t.timestamps
    end
  end
end
