class AddPersonToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      # Add a foreign key to the people table
      t.belongs_to :person
    end
  end
end
