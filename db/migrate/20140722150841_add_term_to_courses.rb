class AddTermToCourses < ActiveRecord::Migration
  def change
  		change_table :courses do |t|
  			# Add foreign key to terms table
  			t.belongs_to :terms
  		end
  	end
end
