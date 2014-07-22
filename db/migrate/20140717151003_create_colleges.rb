class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      # College name
      t.string :name, null:false, default: ''

      # Metadata field
      t.timestamps
    end

    # Indexes on unique attributes
    add_index :colleges, :name, unique: true
  end
end
