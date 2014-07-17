class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	# The person's name
    	t.text :name

    	# Date of Birth of the person
    	t.date :dob
    	
    	# Description of the person
    	t.text :sex
    	t.text :gender
    	
    	# Formal information on the person
		t.text :pronoun
		t.text :title
		t.text :suffix
		
		# Metadata
		t.timestamps
    	end
    end
  end
end
