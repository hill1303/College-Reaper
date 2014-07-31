# The User class represents a user in the application, which is understood to mean a person seeking to generate a
# schedule. Devise uses this model to authenticate sessions as well, so it carries all the attributes necessary for
# all the included Devise modules.
#
# Attributes are stored as follows:
#
#   * +:uuid+ is a "universal" user id, typically some sort of student ID number
#   * +:rank+ is an indicator of class rank, left a little arbitrary, as an integer so comparisons are fast
#   * Attributes wich are required by Devise, organized by the module which requires them are:
#       * +:dabase_authenticatable+ module
#           * +:email+ is the user's email address, stored in plain text, but downcased
#           * +:encrypted_password+ is the peppered and hashed password for the user
#       * +:recoverable+ module
#           * +:reset_password_token+ holds the actual token a user must present to allow access to the reset form
#           * +:reset_password_sent_at+ tracks when the last reset token was sent to the user (via email)
#       * +:rememberable+ module
#           * +:remember_created_at+ records when the user was last "seen" for the purposes of maintaining the session
#       * +:trackable+ module
#           * +:sign_in_count+ counts the number of times the user has signed in
#           * +:current_sign_in_at+ records when the _currently active_ session was started
#           * +:last_sign_in_at+ notes when the _last_ session the user had was started
#           * +:current_sign_in_ip+ gives the IP address of the _currently active_ session
#           * +:last_sign_in_ip+ gives the IP address of the _last_ session the user had
#       * +:confirmable+ module
#           * +:confirmation_token+ the token that must be presented to consider the new email confirmed
#           * +:confirmed_at+ records when the user successfully confirmed their current email address
#           * +:confirmation_sent_at+ records when the user was sent the current confirmation token (via email)
#           * +:unconfirmed_email+ the new email, which has not yet been confirmed
#       * +:lockable+ module
#           * +:failed_attempts+ counts the number of failed sign ins that have occurred since the last successful one
#           * +:unlock_token+ the token that must be presented to re-enable the ability to sign in
#           * +:locked_at+ records when the account reached the maximum number of failures and was locked out
class User < ActiveRecord::Base
  # Include (all) default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  validates :uuid, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :preferences, dependent: :delete_all
  belongs_to :person
  has_many :completions, dependent: :delete_all
  has_many :courses, through: :completions
  has_many :schedules, dependent: :delete_all
  has_and_belongs_to_many :course_groups

  # Allow the user to manage their own Person record from the user account forms
  accepts_nested_attributes_for :person, limit: 1, update_only: true

  # Destroy the Person record(s) (plural just in case) when the User is destroyed
  before_destroy { |record| Person.destroy_all 'user_id = ' << record.id }

  # Accessor for the associated CourseGroups of a User without the :college_global flag set using the cache to limit
  # database queries
  #
  # Returns:
  #
  #   * Cached array of CourseGroup associated with a given College instance where :college_global = false
  def cached_non_global_groups
    Rails.cache.fetch([self, course_groups]) { course_groups.where(college_global: false).to_a }
  end

  # Accessor for the associated CourseGroups of a User without the :college_independent flag set using the cache to
  # limit database queries
  #
  # Returns:
  #
  #   * Cached array of CourseGroup associated with a given College instance where :college_independent = false
  def cached_non_independent_groups
    Rails.cache.fetch([self, course_groups]) { course_groups.where(college_independent: false).to_a }
  end
end
