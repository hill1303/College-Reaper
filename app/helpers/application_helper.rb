# The ApplicationHelper module contains utility methods which are useful to multiple portions of the application. Every
# method added here should have documentation written which includes the standard description, attribute, and return
# information, describes what sort of functionality it provides to the application, which components of the application
# it was initially designed for, and use case examples with demonstration code.
module ApplicationHelper

  # The autocompleted_course_to_id method takes a full course string as an argument which includes the instructional unit
  # course number and description of course. It checks to ensure that the string is in proper format and breaks it down
  # into its three original components to find the associated course within the database, which becomes the return value.
  # If a user did not make an entry, nil is returned instead.
  def autocompleted_course_to_id(course_string)
    matches = course_string.match(/\s\d+\s/)
    unless matches[0].nil?
      course_num = matches[0].strip
      instr_unit = course_string[0, matches.offset(0).first].strip
      course_str = course_string[matches.offset(0).last + 2, course_string.length].strip
      Course.where(instructional_unit: instr_unit, course_number: course_num, name: course_str).first.id
    else
      nil
    end
  end

  # The bias_slider method takes as input the value set on a single slider by a user, ranging from 0 to 1.
  # If the input value falls outside of the 'jail' range (0.45 .. 0.55), the strength of the preference is
  # determined as a percentage from the 'jail' to its associated polar end.
  def bias_slider input
    input = input.to_f
    if input <= 0.45
      { bias: 0, strength: (1-(input/0.45)), value: input}
    elsif input >= 0.55
      { bias: 1, strength: (1-(1-input)/0.45), value: input}
    else
      { bias: nil, strength: 0, value: input}
    end
  end
end
