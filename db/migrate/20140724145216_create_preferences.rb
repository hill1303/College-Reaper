class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      # hstore user scheduling preferences
      t.hstore :choices

      # Associations
      t.belongs_to :schedule
      t.belongs_to :term
      t.belongs_to :user

      # Metadata
      t.timestamps
    end
  end
end
