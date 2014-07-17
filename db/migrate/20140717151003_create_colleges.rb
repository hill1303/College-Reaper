class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|

    	# College name
    	t.string :name

    	# Metadata field
    	t.timestamps
    end
  end
end
