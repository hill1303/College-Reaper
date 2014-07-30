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
  # Gets the set of words which are valid titles
  #
  # Returns:
  #
  #   * an array of titles which will be accepted by the inclusion validator on the :title field
  def self.titles
    %w(Mr. Mrs. Ms. Dr. Rev. Fr. Prof. Hon. Ofc.)
  end

  # Gets the set of words which are valid suffixes
  #
  # Returns:
  #
  #   * an array of suffixes which will be accepted by the inclusion validator on the :suffix field
  def self.suffixes
    %w(Jr. Sr. D.V.M. M.D. D.O. Pharm.D. Ph.D. LL.D. Eng.D. J.D. Ed.D. Esq. III IV V)
  end

  # Gets the set of sexes which are valid
  #
  # Returns:
  #
  #   * an array of sexes which will be accepted by the inclusion validator on the :sex field
  def self.sexes
    %w(Male Female Neither)
  end

  validates :name, presence: true
  validates :dob, presence: true
  validates :sex, inclusion: { in: self.sexes, messages: 'is not a valid sex' }
  validates :pronoun, presence: true
  validates :title, inclusion: { in: self.titles, message: 'is not a valid title' }, allow_blank: true
  validates :suffix, inclusion: { in: self.suffixes, message: 'is not a valid suffix' }, allow_blank: true
  has_one :user
end