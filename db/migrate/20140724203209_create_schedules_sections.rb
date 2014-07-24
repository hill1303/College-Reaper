class CreateSchedulesSections < ActiveRecord::Migration
  def change
    create_table :schedules_sections, :id => false do |t|
      # Associations to Schedule and Section
      t.belongs_to :schedule
      t.belongs_to :section
    end
  end
end
