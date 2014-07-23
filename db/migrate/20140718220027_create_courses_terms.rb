class CreateCoursesTerms < ActiveRecord::Migration
  def change
    create_table :courses_terms, id: false do |t|
      t.belongs_to :course
      t.belongs_to :term
    end
  end
end
