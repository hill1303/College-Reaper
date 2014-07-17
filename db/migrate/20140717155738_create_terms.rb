class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
    	
    	# General Term info
    	t.string :name
    	t.date :start_date
    	t.date :end_date

    	# Metadata field
    	t.timestamps
    end
  end
end
