class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      # General Term info
      t.string :name,  null:false, null:false, default: ''
      t.date :start_date, null:false, null:false, default: ''
      t.date :end_date, null:false, null:false, default: ''

      # Metadata field
      t.timestamps
    end
  end
end
