class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      # General Term info
      t.string :name,  null:false, default: ''
      t.date :start_date, null:false, default: Date.new(2014, 1, 10)
      t.date :end_date, null:false, default: Date.new(2014, 4, 30)

      # Metadata field
      t.timestamps
    end
  end
end
