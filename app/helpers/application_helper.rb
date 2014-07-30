# The ApplicationHelper module contains utility methods which are useful to multiple portions of the application. Every
# method added here should have documentation written which includes the standard description, attribute, and return
# information, describes what sort of functionality it provides to the application, which components of the application
# it was initially designed for, and use case examples with demonstration code.
module ApplicationHelper
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
