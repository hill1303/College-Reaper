class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      # hstore user scheduling preferences
      t.hstore :choices

      # Metadata
      t.timestamps
    end
  end
end