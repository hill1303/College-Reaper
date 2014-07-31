# The AutocompleteHelper module contains a method used to create a variable of all courses that can be found with the
# Autocomplete feature.
module AutocompleteHelper
  # The courses_for_autocomplete method is called in the +autocomplete.coffee.erb+ file to obtain an array of
  # all courses in the database. Each stored string consists of the intructional unit, course number and breif
  # description of the course that will appear in a list for the user if they enter matching first characters.
  def courses_for_autocomplete
    courses = Array.new
    Course.all.each do |course|
      courses.push({ course: String.new << course.instructional_unit << ' ' << course.course_number << ' - ' << course.name })
    end
    courses
  end
end