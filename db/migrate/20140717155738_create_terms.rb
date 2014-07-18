class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
    	
    	# General Term info
    	t.string :name,  null:false
    	t.date :start_date, null:false
    	t.date :end_date, null:false

    	# Metadata field
    	t.timestamps
    end
  end
end
