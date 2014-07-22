# The Person class represents a real world person.
#
# Attributes are stored as follows:
#
#   * +:name+ stores the name of the person.
#   * +:dob+ gives the date of birth of the person.
#   * +:sex+ is the sex of the person (Male, Female, or Neither).
#   * +:gender+ gives the gender identity of the person.
#   * +:pronoun+ is the word the person wants to be refer to by in third person (He, She, It, Their, etc.).
#   * +:title+ is the prefix of the person when referred to in a formal manor (Mr., Mrs, Dr., etc).
#   * +:suffix+ is a set of qualifications or genealogical identifiers of a person (PHD, MD, etc).
class Person < ActiveRecord::Base
	validates :name, presence: true
	validates :dob, presence: true
  	validates :sex, presence: true

	has_one :user
end