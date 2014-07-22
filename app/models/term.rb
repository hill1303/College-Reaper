# The +Term+ class represents a single term of a section of a course offered by a College

# Term Attributes are stored as follows: 

# * +:name+ is stored as string and represents the name of the term 
# * +:start_date+ is stored as date and represents the start date of the section for the term
# * +:end_date+ is stored as date and represents the end date of the section for the term


class Term < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_and_belongs_to_many :courses
end
