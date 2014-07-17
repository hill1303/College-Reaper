class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
    	
    	# General Term info
    	t.string :name
    	t.date :start
    	t.date :end

    	# Metadata field
    	t.timestamps
    end
  end
end
