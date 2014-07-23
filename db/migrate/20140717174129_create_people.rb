class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      # The person's name
      t.text :name, default: '', null: false

      # Date of Birth of the person
      t.date :dob, default: Date.new(2014, 1, 1), null: false

      # Description of the person
      t.text :sex, :default 'N', null: false
      t.text :gender

      # Formal information on the person
      t.text :pronoun, default: 'their', null:  false
      t.text :title
      t.text :suffix

      # Metadata
      t.timestamps
    end
  end
end
