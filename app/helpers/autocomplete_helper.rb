module AutocompleteHelper
  def courses_for_autocomplete
    courses = Array.new
    Course.all.each do |course|
      courses.push({ course: String.new << course.instructional_unit << ' ' << course.course_number << ' - ' << course.name })
    end
    courses
  end
end