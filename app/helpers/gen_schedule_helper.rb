require 'set'
require 'course'
require 'course_group'
require 'section'
require 'preference'
require 'user'
require 'location'

# This module provides interfaces for generating schedule mock-ups using user preferences and a set of available class sections.
module GenScheduleHelper
  # The MockSchedule class represents a simple mock-up of a Schedule's content for the purpose of generating and
  # evaluating Schedules for a User based on specified preferences.
  class MockSchedule

    # Single character representations of the days in the week.
    DAYS_OF_THE_WEEK = ["U", "M", "T", "W", "R", "F", "S"]
    
    # The approximate radius of the Earth in Kilometers.
    RADIUS_OF_EARTH = 6378

    # An arbitrary approximation of a few feet in distance to prevent divide by zero issues (this value is specifically
    # in Kilometers).
    SAME_LOCATION_DISTANCE = 0.001

    # An arbitrary normalization factor used in reducing overly large distance scores. 
    DISTANCE_BIAS_FACTOR = 100

    # The set of class sections that makes up +self+.
    attr_accessor :class_section_set
    
    # The user preferences used in scoring and building +self+.
    attr_reader :preferences

    # The total score of +self+ across all heuristics.
    attr_reader :aggregate_score
    
    # The time heuristic sub_score 
    attr_reader :time_sub_score
    
    # The distance heuristic sub_score
    attr_reader :distance_sub_score
    
    # The ge major heuristic sub_score
    attr_reader :ge_major_sub_score
    
    # The credit hour heuristic sub_score
    attr_reader :credit_hour_sub_score

    # Initialize an empty MockSchedule with a set of user preferences.
    #
    # Parameters:
    #
    #   * +preferences+ - The +hstore+ preferences object that corresponds to the users preferences.
    def initialize(preferences)
      @preferences = preferences
      @class_section_set = Set.new
      @aggregate_score = 0
      @time_sub_score = 0
      @distance_sub_score = 0
      @ge_major_sub_score = 0
      @credit_hour_sub_score = 0
    end

    # Overrides Object's standard +eql?+ method.
    #
    # Returns:
    #
    #   +true+ if the set of class sections in +self+ is equal to the class sections found in +other_schedule+, +false+
    #   otherwise.
    #
    # Parameters:
    #
    #   * +other_schedule+ - The other schedule against which +this+ is being compared for equivalence.
    def eql?(other_schedule)
      @class_section_set == other_schedule.class_section_set
    end

    # Overrides Object's standard +hash+ method.
    #
    # Returns:
    #
    #   A +hash+ representation of the class sections found in +self+.
    #
    def hash
      @class_section_set.hash
    end

    # Adds a class section to the class section set of +self+.
    #
    # Returns:
    #
    #   The class section set of +self+ if the class section set does not contain +class_section+. +nil+ is returned if the
    #   class section set already contains +class_section+. This mimics +Set+'s +add?+ behavior.
    #
    # Parameters:
    #
    #   * +class_section+ - The class section to be added to +self+.
    def assign_class_section!(class_section)
      @class_section_set.add? class_section
    end

    # Removes a class section from the class section set of +self+.
    #
    # Returns:
    #
    #   The class section set of +self+ if the class section set contains +class_section+. +nil+ is returned if the class
    #   section set did not contain +class_section+. This mimics +Set+'s +delete?+ behavior.
    #
    # Parameters:
    #
    #   * +class_section+ - The class section to be removed from +self+.
    def unassign_class_section!(class_section)
      @class_section_set.delete? class_section
    end

    # Checks if +self+ is a valid representation of a Schedule based on +preferences+.
    #
    # Returns:
    #
    #   +true+ if the following conditions are met and +false+ otherwise.
    #     * +self+ is a full schedule (contains the number of courses specified in preferences) 
    #     * +self+ has an acceptable number of credit hours (between minimum and maximum credit hours as specified in +preferences+)
    #     * +self+ contains all courses explicitly named in preferences
    #     * +self+ has no time conflicts
    #     * +self+ has no course conflicts (no courses of the same name/id)
    def is_valid?
      is_full? @preferences, @class_section_set and not contains_course_conflict? @class_section_set and 
          contains_explicit_courses? @preferences, @class_section_set and 
            not contains_time_conflict? @class_section_set
    end

    # Checks if +class_section+ is able to be added to +self+ based on the contents of +self+'s class section set.
    #
    # Returns:
    #
    #   +true+ if +class_section+ does not conflict with any class sections already present in +self+ (time and
    #   course name) and +self+ is not already full.
    #
    # Parameters:
    #
    #   * +class_section+ - The class section to be verified against the contents of +self+.
    def safe_assignment?(class_section)
      time_safe? @class_section_set, class_section and course_safe? @class_section_set, class_section and 
        not is_full? @preferences, @class_section_set
    end

    # Fills +self+ with class sections from a set of class sections. A full MockSchedule is one with the number of
    # class sections equal to that specified in +preferences+.
    #
    # Notes:
    #
    #   This method makes use of a recursive backtracking algorithm and _does not necessarily_ create an optimal schedule.
    #
    # Returns:
    #
    #   +true+ if the schedule was able to be filled using the class sections found in the passed +class_section_set+
    #   and +false+ otherwise.
    #
    # Parameters:
    #
    #   * +class_section_set+ - The set of all possible sections from which to create a schedule.
    def fill_schedule!(class_section_set)
      if is_valid?
        evaluate!
        return true
      end
      class_section_set.each do |class_section|
        # NOTE: the class section below is an instance variable, and is NOT the same set as the parameter passed in
        if safe_assignment? class_section
          assign_class_section! class_section
          if fill_schedule! class_section_set
            return true
          else
            unassign_class_section! class_section
          end
        end
      end
      return false
    end

    # Assigns a score of +self+ based on how well +self fits preferences (specified by +preferences+) the following heuristics (list
    # may change over time):
    #
    # * Time
    # * Distance
    # * GE or Major Course Content
    # * Total Credit Hours
    #
    # Returns:
    #
    #   The aggregate score of +self+ from all heuristics.
    def evaluate!
      @time_sub_score = time_score @preferences, @class_section_set
      @distance_sub_score = distance_score @preferences, @class_section_set
      @ge_major_sub_score = ge_major_score @preferences, @class_section_set
      @credit_hour_sub_score = credit_hour_score @preferences, @class_section_set
      
      @aggregate_score = @time_sub_score + @distance_sub_score + @ge_major_sub_score + @credit_hour_sub_score
    end

    # Resets +self+'s class section set with a new, random, and full class section set. Reset also evaluates +self+.
    #
    # Returns:
    #
    #   The result of +fill_schedule!+; +true+ if the schedule could be filled using +class_section_set+,
    #   +false+ otherwise.
    #
    # Parameters:
    #   
    #   * +class_section_set+ - The set of sections available to fill a schedule with.
    def reset!(class_section_set)
      @class_section_set = Set.new
      section_shuffle = class_section_set.to_a.shuffle
      fill_schedule! section_shuffle.to_set
    end

    # Replaces +self+'s class section set with that of +class_section_set+. This does _not_ guarantee that +self+ will be valid after
    # replacement.
    #
    # Returns:
    #   
    #   The class section set that was assigned to +self+.
    #
    # Parameters:
    #
    #   * +class_section_set+ - The class section set that will replace +self+'s class section set.
    def set_class_sections(class_section_set)
      @class_section_set = Set.new class_section_set
    end
    

    # Checks whether two class sections occur on the same day.
    #
    # Returns:
    #   
    #   +true+ if +class_section+ occurs on the same day as +other_class_section+, +false+ otherwise.
    #
    # Parameters:
    # 
    #   * +class_section+ - A class section to check against another section.
    #   * +other_class_section+ - The other class section that is being checked against by a section.
    #
    def share_day?(class_section, other_class_section)
      # Substring hand-waving, check if the repeat pattern of a section has any matching days with the other sections
      class_section.rpt_pattern.scan(/./).any? { |day| other_class_section.rpt_pattern.include? day }
    end
   
    # Checks if two class sections belong to the same course.
    #
    # Returns:
    #
    #   +true+ if the sections belong to the same course, +false+ otherwise.
    #
    # Parameters:
    #
    #   * +class_section+ - A class section to check against another section.
    #   * +other_class_section+ - The other class section that is being checked against by a section.
    def course_times_overlap?(class_section, other_class_section)
      if class_section.start_time > other_class_section.end_time or
          class_section.end_time < other_class_section.start_time
        return false
      else
        return true
      end
    end

    # Checks whether adding a class section would cause a time conflict with class sections already present in a section set.
    # NOTE: This does not actually _add_ the course to the section set.
    #
    # Returns:
    #
    #   +true+ if adding +class_section+ to +self+ does not cause any time conflicts, +false+ otherwise.
    #
    #   * +class_section_set+ - A set of class sections to check against, likely belonging to a schedule.
    #   * +other_class_section+ - The other class section that is being checked against by a section.
    def time_safe?(class_section_set, class_section)
      class_section_set.each do |scheduled_class_section|
        return false if scheduled_class_section.id == class_section.id
        if share_day? scheduled_class_section, class_section
          # Now check for time conflicts, ie not non-conflicting times
          return false if course_times_overlap? scheduled_class_section, class_section
        end
      end
      return true
    end
    
    # Checks whether adding a class section would cause a set to contain class sections belonging to the same course.
    # NOTE: This does not actually _add_ the course to the section set.
    #
    # Returns:
    #
    #   +true+ if adding +class_section+ to +class_section_set+ does not cause the set to contain two sections of the same course, 
    #   +false+ otherwise.
    #
    #   * +class_section_set+ - A set of class sections to check against, likely belonging to a schedule.
    #   * +other_class_section+ - The other class section that is being checked against by a section.
    def course_safe?(class_section_set, class_section)
      class_section_set.each do |scheduled_class_section|
        return false if scheduled_class_section.course_id == class_section.course_id
      end
      return true
    end

    # Totals the number of credit hours of the class sections in a class section set.
    #
    # Returns:
    #   
    #   The total number of credit hours of the class sections in +class_section_set+.
    #
    # Paramters:
    #   
    #  * +class_section_set+ - A set of class sections, likely belonging to a schedule.
    def total_credit_hours_of(class_section_set)
      total_credit_hours = 0
      class_section_set.each { |class_section| total_credit_hours += class_section.cached_course.credit_hours }
      return total_credit_hours
    end

    # Retrieves a set of courses explicitly named in user preferences.
    #
    # Returns:
    #
    #   A set of courses explicitly named in preferences.
    #
    # Parameters:
    #   
    #  * +preferences+ - The user preferences object from which to pull named courses.
    def get_named_courses_from(preferences)
      named_courses = Set.new
      preferences.choices.keys.each do |key|
        if key.to_s.match(/course[0-9]+/) 
          named_courses.add preferences.choices[key] 
        end
      end
      return named_courses
    end

    # Checks whether a class section set contains a subset consisting of the explicitly named courses in user preferences.
    #
    # Returns:
    #   
    #   +true+ if +class_section_set+ contains the explicitly named courses found in +preferences+, +false+ otherwise.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a set of explicitly named courses.
    #   * +class_section_set+ - The class section set to check against, likely belonging to a schedule.
    def contains_explicit_courses?(preferences, class_section_set)
      # Get set of explicitly named courses
      named_courses = get_named_courses_from preferences
      scheduled_courses = Set.new
      class_section_set.each do |class_section|
        scheduled_courses.add class_section.cached_course.id
      end
      return named_courses.subset? scheduled_courses
    end

    # Checks whether a class section set contains an acceptable credit hour total (acceptable meaning that the total falls
    # within the range of credit hours specified in the user preferences).
    #
    # Returns:
    #
    #   +true+ if the total number of credit hours falls within the range specified in +preferences+, +false+ otherwise.
    #   
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a credit hour range.
    #   * +class_section_set+ - The class section set to check against, likely belonging to a schedule.
    def acceptable_credit_hours?(preferences, class_section_set)
      schedule_total = total_credit_hours_of class_section_set
      # Get credit hour range from prefs
      credit_min = preferences.credit_min.to_i
      credit_max = preferences.credit_max.to_i
      schedule_total.between? credit_min, credit_max
    end

    def contains_acceptable_time_range(preferences, class_section_set)
      # Get time range from preferences
      start_time_pref = Time.parse preferences.start_time
      end_time_pref = Time.parse preferences.end_time
      
      class_section_set.each do |class_section|
        section_time_start = class_section.start_time
        section_time_end = class_section.end_time
        unless time_range_contains_other_time_range start_time_pref, end_time_pref, 
            section_time_start, section_time_end
          return false
        end
      return true
      end
    end
    
    # Checks whether a class section set has the number of courses specified in the user preferences.
    #
    # Returns: 
    #
    #   +true if +class_section_set+ contains the number of courses specified in +preferences+, +false+ otherwise.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a credit hour range.
    #   * +class_section_set+ - The class section set to check against, likely belonging to a schedule.# Parameters:
    def is_full?(preferences, class_section_set)
      return class_section_set.size == preferences.num_courses.to_i
    end
  
  
    # Checks if a time (from a time range) begins earlier than another time.
    # 
    # Returns:
    #
    #   +true+ if +time+ occurs at the same time or earlier than +other_time+, +false+ otherwise.
    #
    # Paramters:
    #
    #   * +time+ - The time being compared to another time.
    #   * +other_time+ - The other time being compared to the first time.
    def time_earlier_than_other_time(time, other_time)
      hour_diff = time.hour - other_time.hour
      min_diff = time.min - other_time.min
      if hour_diff == 0
        if min_diff > 0
          return false
        else
          return true
        end
      elsif hour_diff > 0
        return false
      else
        return true
      end
    end
   
    # Checks if a time (from a time range) begins later than another time.
    # 
    # Returns:
    #
    #   +true+ if +time+ occurs at the same time or later than +other_time+, +false+ otherwise.
    #
    # Paramters:
    #
    #   * +time+ - The time being compared to another time.
    #   * +other_time+ - The other time being compared to the first time.
    def time_later_than_other_time(time, other_time)
      hour_diff = time.hour - other_time.hour
      min_diff = time.min - other_time.min
      if hour_diff == 0
        if min_diff < 0
          return false
        else
          return true
        end
      elsif hour_diff > 0
        return true
      else
        return false
      end
    end
    
    # Checks whether a time range (created from the first two parameters) contains another time range
    def time_range_contains_other_time_range(start_time, end_time, other_start_time, other_end_time)
      time_earlier_than_other_time start_time, other_start_time and
        time_later_than_other_time end_time, other_end_time
    end
 
    # Assigns a score for the timing of a class section set. Section sets whose sections time ranges fall within the
    # time range specified in user preferences will score higher than those whose sections do not fall in that range.
    #
    # Returns:
    #   
    #   A variable score of zero or greater that corresponds to +class_section_set+'s adherence to a time range specified
    #   in +preferences+.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a time range.
    #   * +class_section_set+ - The class section set for which to calculate a score.
    def time_score(preferences, class_section_set)
      # Get time range from preferences
      start_time_pref = Time.parse preferences.start_time
      end_time_pref = Time.parse preferences.end_time
      # Get weight of importance for time
      time_pref_weight = preferences.time_weight.to_f
      classes_in_range = 0
      class_section_set.each do |class_section|
        section_time_start = class_section.start_time
        section_time_end = class_section.end_time
        if time_range_contains_other_time_range start_time_pref, end_time_pref, 
            section_time_start, section_time_end
        end
      end
      return time_pref_weight * classes_in_range
    end

    # Calculates the distance between two locations, based on Equirectangular approximation distance.
    #
    # Returns:
    #
    #   The distance between +location+ and +other_location+.
    #
    # Parameters:
    #  
    #  * +location+ - A location point, from which a distance to another point will be calculated.
    #  * +other_location+ - Another location point, from which a distance to another point will be calculated.
    def calculate_distance(location, other_location)
      x = (other_location.x - location.x) * Math.cos((location.y + other_location.y) / 2)
      y = other_location.y - location.y
      distance = Math.sqrt(x**2 + y**2) * RADIUS_OF_EARTH
      if distance != 0
        return distance
      else
        return SAME_LOCATION_DISTANCE
      end
    end
   
    # Calculates the total travel distance approximation between class sections on a particular day.
    #
    # Returns:
    #
    #   The total travel distance approximation between class sections in +class_sections_on_day+.
    #
    # Parameters:
    #
    #   * +sorted_class_sections_on_day+ - The set of classes that occur on a particular day.
    def total_distance_of(sorted_class_sections_on_day)
      distance = 0
      # Calculate distance by class_section pairs in sorted list
        (sorted_class_sections_on_day.size - 1).times do |i|
          location = sorted_class_sections_on_day[i].cached_coordinates
          other_location = sorted_class_sections_on_day[i+1].cached_coordinates
          distance += calculate_distance location, other_location
        end
    end

    # Retrieves a sorted list of class sections (sorted by time) which occur on a particular day.
    #
    # Returns:
    #
    #   The set of classes, in sorted order of time, which occur on +day+.
    #
    # Parameters:
    #
    #   * +day+ - A day represented as a single character, the representation of which is as follows.
    #     * Sunday: 'U'
    #     * Monday: 'M'
    #     * Tuesday: 'T'
    #     * Wednesday: 'W'
    #     * Thursday: 'R'
    #     * Friday: 'F'
    #     * Saturday: 'S'
    #  * +class_section_set+ - The set of class sections, likely belonging to a schedule.
    def sorted_classes_on(day, class_section_set)
      # Find all class_sections that occur on day
      classes_on_day = class_section_set.select { |class_section| class_section.rpt_pattern.include? day }
      # Sort list of classes by time
      classes_on_day.to_a.sort! do |class_section, other_class_section|
        class_section.start_time <=> other_class_section.start_time
      end
    end
 
    # Assigns a score for the approximate walking distance total of a class section set. Section sets whose approximate total 
    # walking distances are low correspond to higher scores as compared to those whose total distances are higher.
    #
    # Returns:
    #   
    #   A variable score of zero or greater that corresponds to +class_section_set+'s total walking distance approximation.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a weight of importance for travel distance.
    #   * +class_section_set+ - The class section set for which to calculate a score.
    def distance_score(preferences, class_section_set)
      # Get weight of importance for distance
      distance_pref_weight = preferences.distance_weight.to_f
      day_sums = Hash.new(0)
      DAYS_OF_THE_WEEK.each do |day|
        classes_on_day = sorted_classes_on day, class_section_set
        day_sums[day] = total_distance_of classes_on_day
      end
      # Sum the total distance traveled in the whole week
      week_total = SAME_LOCATION_DISTANCE
      day_sums.each { |day, sum| week_total += sum }
      # Really this is weight * (1/total_distance). (1/distance) is used to "punish" high and "reward" small distances
      
      return distance_pref_weight / week_total.abs
    end
   
    # Counts the number of courses in a class section setthat are considered a general education course (that is, the course is not a 
    # major or minor course).
    #
    # Returns:
    #
    #   The total count of courses in +class_section_set+ that are considered a general education course.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preference used in retrieving course groups to which a user belongs.
    #   * +class_section_set+ - A set of class sections, likely belonging to a schedule. 
    def count_ge_courses(preferences, class_section_set)
      num_ge_classes = 0
      # sum of classes that come from gen course group
      preferences.cached_user.cached_non_independent_groups.each do |major|
        major.cached_college.cached_global_groups.each do |course_group|
          class_section_set.each do |class_section|
            if course_group.cached_courses.include? class_section.cached_course
              num_ge_classes += 1
            end
          end
        end
      end
      return num_ge_classes
    end
    
    # Counts the number of courses in a class section setthat are considered a major course (that is, the course is not a general 
    # education course).
    #
    # Returns:
    #
    #   The total count of courses in +class_section_set+ that are considered a general education course.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preference used in retrieving course groups to which a user belongs.
    #   * +class_section_set+ - The set of class sections, likely belong to a schedule.
    def count_major_courses(preferences, class_section_set)
      num_major_classes = 0
      # sum of classes that come from major course group
      preferences.cached_user.cached_non_global_groups.each do |course_group|
        class_section_set.each do |class_section|
          if course_group.cached_courses.include? class_section.cached_course
            num_major_classes += 1
          end
        end
      end
      return num_major_classes
    end

    # Assigns a score for the number of courses that fall in a user specified course group category (either major or general education). 
    # Section sets which contain more courses in the course group category preference correspond to higher scores.
    #
    # Returns:
    #   
    #   A variable score of zero or greater that corresponds to how many class sections in +class_section_set+ belong to the user 
    #   specified category.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a course group category preference.
    #   * +class_section_set+ - The class section set for which to calculate a score. 
    def ge_major_score(preferences, class_section_set)
      ge_major_pref_weight = preferences.ge_major_lean_weight.to_f
      ge_major_pref_lean = preferences.ge_major_lean.downcase
      if ge_major_pref_lean == 'ge'
        classes_in_pref = count_ge_courses preferences, class_section_set
        
      elsif ge_major_pref_lean == 'major'
        classes_in_pref = count_major_courses preferences, class_section_set
      else
        classes_in_pref = 0
      end
      return ge_major_pref_weight * classes_in_pref
    end
    
    # Assigns a score for the total number of credit hours in a class section set and how close that total is to the user specified credit 
    # hour max/min preference. Section sets whose total credit hours are closer to the specified credit hour max/min score higher.
    #
    # Returns:
    #   
    #   A variable score of zero or greater that corresponds to +class_section_set+'s total credit hour proximity to the credit hour
    #   max/min specified in +preferences+.
    #
    # Parameters:
    #
    #   * +preferences+ - The user preferences containing a credit hour max/min preference.
    #   * +class_section_set+ - The class section set for which to calculate a score. 
    def credit_hour_score(preferences, class_section_set)
      schedule_credit_hours = total_credit_hours_of class_section_set
      credit_pref_weight = preferences.credit_lean_weight.to_f
      credit_pref_lean = preferences.credit_lean.downcase
      if credit_pref_lean == 'low'
        return credit_pref_weight / ((schedule_credit_hours - preferences.credit_min.to_i).abs + 1)
      elsif credit_pref_lean == 'high'
        return credit_pref_weight / ((schedule_credit_hours - preferences.credit_max.to_i).abs + 1)
      else
        return 0
      end
    end
   
    # Checks whether a class section set contains any sections with duplicate course ids.
    #
    # Returns:
    #
    #   +true+ if +class_section_set+ contains any sections with duplicate course ids, +false+ otherwise.
    #
    # Parameters:
    #   * +class_section_set+ - The class section set against which to check for duplicate course ids.
    def contains_course_conflict?(class_section_set)
      class_section_set.each do |scheduled_class_section|
        class_section_set.each do |class_section|
          if scheduled_class_section != class_section
            return true if scheduled_class_section.course_id == class_section.course_id
          end
        end
      end
      return false
    end
     
    # Checks whether a class section set contains any class sections whose times overlap.
    #
    # Returns:
    #
    #   +true+ if +class_section_set+ contains any sections whose times overlap, +false+ otherwise.
    #
    # Parameters:
    #   * +class_section_set+ - The class section set against which to check for class section time overlap.
    def contains_time_conflict?(class_section_set)
      class_section_set.each do |scheduled_class_section|
        class_section_set.each do |class_section|
          if share_day?(scheduled_class_section, class_section) and 
              not scheduled_class_section.id == class_section.id
            # Now check for time conflicts, ie not non-conflicting times
            return true if course_times_overlap? scheduled_class_section, class_section
          end
        end
      end
      return false
    end
  end

  # This ScheduleGenerator class provides some general methods for generating sets of schedules based on user preferences
  # and a set of class sections that are available from which to make schedules.
  # 
  # NOTES: Behind the scenes, a genetic algorithm is employed which attempts to approach the NP-Complete problem of creating
  # all possible schedule permutations from a set of class sections and provides an approximation of an optimal schedule based
  # on preferences. Because of this, some of the methods available to the schedule generators consider schedules in a  genetic 
  # paradigm rather than strictly as schedules/classes. Notably, the documentation will have the following vocabulary.
  #   * Individual: a single entity that exists as part of a population. As it pertains to this class, an individual is a 
  #     schedule.
  #   * Mutation: altering a genetic sequence to contain new, possibly unseen genes. As it pertains to this class, a 
  #     schedule's class section set gets altered to possibly contain new, random class sections.
  #   * Mate Selection: individuals select mates that are close in fitness to themselves, but have a low probability of
  #     selecting a random mate from a gene pool. As it pertains to this class, a mate is a schedule whose aggregate score
  #     is most similar to another schedule's aggregate score, or a random selection from a schedule set.
  #   * Fitness: the overall rank/ability of an individual to survive in a population. As it pertains to this class, a
  #     schedule's fitness is it's aggregate heuristic score.
  #   * Population: a large group of individuals that interact by "mating" (ie. exchanging genes) and dying. As it pertains
  #     to this class, a population is a set of schedules.
  #   * Genes: a single item used in a sequence/set to represent an individual's unique properties. As it pertains to this
  #     class, a schedule's class sections are considered individual genes.
  #   * Gene Sequence: a set of genes that make up the representation of an indivual. As it pertains to this class, a
  #     schedule's class section set is considered a gene sequence.
  class ScheduleGenerator

    # A low probability used in determining whether a schedule's gene sequence should be mutated with new, random genes.
    MUTATION_RATE = 0.02

    # A some-what low probability that an individual will select a random mate rather one that is the next best individual.
    RANDOM_SELECTION_RATE = 0.10

    # The number of generations that should pass before a population is to be considered as converged.
    MAX_STALE_GENERATIONS = 3

    # The maximum number of individuals that are to be generated by way of permutation generation.
    MAX_POPULATION_SIZE = 250

    # The number of worker threads amongst which the task of filling the initial set of schedules will be distributed
    SCHEDULE_GENERATOR_THREADS = 6

    # Randomly replaces class sections/genes in a schedule with class sections/genes from a pool of available 
    # class sections/genes.
    #
    # Returns:
    #   
    #   The resulting +class_section_set+ (gene sequence) of a schedule after being mutated with random new 
    #   class sections/genes.
    #
    # Parameters:
    #
    #   * +schedule+ - The individual to be mutated.
    #   * +class_section_set+ - The pool of available class sections, selections from which randomly get inserted into
    #     +schedule+.
    def self.mutate!(schedule, class_section_set)
      # Merely converting to a list so that we may use the sample method on a set of class_sections
      class_section_set_list = class_section_set.to_a
      schedule.class_section_set.map! do |scheduled_class_section|
        if Random.rand <= MUTATION_RATE
          random_new_gene = class_section_set_list.sample
        else
          scheduled_class_section
        end
      end
    end

    # Swaps a random number of class sections/genes from one schedule to another and vice versa. This is considered a
    # breeding of the two schedules.
    #
    # Returns:
    #   
    #   The two schedules that result from swapping over random class sections/genes.
    #
    # Parameters:
    #   
    #   * +schedule+ - One of the schedules to be mated with another schedule.
    #   * +other_schedule+ - The other schedule to be mated with another schedule.
    def self.exchange_genes!(schedule, other_schedule)
      # Get a random number of genes to swap
      num_genes_to_swap = (1...schedule.preferences.num_courses.to_i).to_a.sample
      schedule_swap = schedule.class_section_set.to_a.sample num_genes_to_swap
      other_schedule_swap = other_schedule.class_section_set.to_a.sample num_genes_to_swap
      # Remove the genes to be swapped from their original gene sequence...
      schedule.class_section_set.subtract schedule_swap
      other_schedule.class_section_set.subtract other_schedule_swap
      # ...and insert them into the other gene sequence
      schedule.class_section_set.merge other_schedule_swap
      other_schedule.class_section_set.merge schedule_swap 
      return schedule, other_schedule
    end

    # Creates a new schedule set/population, using the following steps.
    #   * Select a mate for an individual.
    #   * Mate the two individuals (crossover/exchange genes).
    #   * Apply random mutation to their resulting new gene sequences.
    #   * Add the two individuals to a new population/gene pool.
    #
    # Returns:
    #   
    #   A new population set containing the next generation of individuals/schedules.
    #
    # Parameters:
    #
    #   * +schedule_set+ - The current population of schedules from which to create a new generation.
    #   * +class_section_set+ - A pool of class sections from which to select random elements and insert
    #     into an individuals gene sequence during mutation.
    def self.new_generation!(schedule_set, class_section_set)
      new_generation = Set.new
      schedule_set.each do |schedule|
        # Select a mate for the schedule
        mate = select_mate schedule, schedule_set
        unless mate.nil?
          # Breed the two schedules and mutate them
          exchange_genes! schedule, mate
          mutate! schedule, class_section_set
          mutate! mate, class_section_set
          
          # Add these children to the gene pool
          new_generation.add? schedule
          new_generation.add? mate
        end
      end
      return new_generation
    end

    # Selects the next most fit schedule or with some low probability, a random schedule from +schedule_set+.
    #
    # Returns:
    #
    #   The selected mate from a population/+schedule_set+. +nil+ in the case when no next best mate exists
    #   for +schedule+ (that is, +schedule+ is the least fit individual of a population).
    #
    # Parameters:
    #
    #   * +schedule+ - A schedule for which a mate is being selected.
    #   * +schedule_set+ - The population from which to select a mate.
    def self.select_mate(schedule, schedule_set)
      # Convert the schedule set to an array simply for using the sample method
      schedule_list = schedule_set.to_a
      if Random.rand <= RANDOM_SELECTION_RATE
        random_mate = schedule_list.sample
        return random_mate
      else
        schedule_list.sort! { |a,b| b.aggregate_score <=> a.aggregate_score }
        schedule_index = schedule_list.index schedule
        mate = schedule_list[schedule_index + 1]
        return mate
      end
    end

    # Evaluates the overall fitness of a population as well as the fitness of the most fit individual in a
    # population.
    #
    # Returns:
    #
    #   The fitness of the most fit individual in +schedule_set+ and the overall average fitness of +schedule_set+.
    #
    # Parameters:
    #
    #   * +schedule_set+ - The population of schedules to be evaluated.
    def self.evaluate_population(schedule_set)
      schedule_list = schedule_set.to_a
      schedule_list.sort! { |a,b| b.aggregate_score <=> a.aggregate_score }
      top_individual_score = schedule_list.first.aggregate_score
      score_sum = 0
      schedule_set.each { |schedule| score_sum += schedule.aggregate_score }
      avg = score_sum / schedule_set.size
      return top_individual_score, avg
    end

    # Generates a set of schedules by way of permutation generation.
    # NOTE: For large sets of class sections, this becomes computationally intractable and is in fact capped
    # by a total population size constant.
    #
    # Returns:
    #   
    #   A set of random, valid schedules.
    #
    # Parameters:
    #
    #   * +preferences+ - A collection of user preference settings.
    #   * +class_section_set+ - A set of class sections that are available and from which to generate a schedule.
    def self.generate_permutations_of_schedules(preferences, class_section_set)
      schedules = Set.new
      class_section_list = class_section_set.to_a
      # Create a set of valid possible schedules with a cap set to prevent long computation time
      class_section_list.combination preferences.num_courses.to_i do |possible_schedule|
        schedule = MockSchedule.new(preferences)
        schedule.class_section_set = possible_schedule

        if schedule.is_valid?
          schedule.evaluate!
          schedules.add? schedule
        end
        break if schedules.size >= MAX_POPULATION_SIZE
      end
      return schedules
    end

    # Finds invalid schedules in a population and removes them, replacing them with random and valid schedules.
    #
    # Returns:
    #   
    #   A set/population of valid schedules.
    #
    # Parameters:
    #
    #   * +schedule_set+ - The original population of schedules to be validated/cleaned.
    #   * +class_section_set+ - The set of class sections from which to select random new class sections/genes.
    def self.purge_and_replace_invalid_schedules!(schedule_set, class_section_set)
      schedule_set.each do |schedule|
        unless schedule.is_valid?
          schedule.reset! class_section_set
          schedule.evaluate!
        end
      end
      return schedule_set
    end
   
    # Generates a limited set of random, valid schedules from a set of available class sections. It is multithreaded,
    # and spawns +SCHEDULE_GENERATOR_THREADS+ number of workers. Each worker is autonomous within their own subsets of
    # the universe of all possible sections to generate schedules within their subsets alone.
    # NOTE: This does _NOT_ generate the set of all _possible_ schedules.
    #
    # Returns:
    #     
    #  A set of random, valid schedules.
    #
    # Parameters:
    #
    #   * +preferences+ - A collection of user specified preferences.
    #   * +class_section_set + - The set of class sections available from which to generate schedules.
    def self.generate_schedules(preferences, class_section_set)
      schedule_set = Set.new
      class_section_array = class_section_set.to_a

      # Throw some threads out to do this fast...super tedious task, this is. The mutex protects schedule_set from
      # synchronization errors.
      threads = []
      mutex = Mutex.new
      SCHEDULE_GENERATOR_THREADS.times do |i|
        thread_start = (i * class_section_array.size) / SCHEDULE_GENERATOR_THREADS
        thread_end = ((i + 1) * class_section_array.size) / SCHEDULE_GENERATOR_THREADS

        threads << Thread.new {
          working_set = Set.new(class_section_array.slice(thread_start..thread_end))

          working_set.each do |class_section|
            schedule = MockSchedule.new preferences
            schedule.fill_schedule! working_set
            if schedule.is_valid?
              schedule.evaluate!
              # Mutex-controlled, synchronized add
              mutex.synchronize {
                schedule_set.add? schedule
              }
              # Delete the section from the working set, preventing generation from starting with that section again
              working_set.delete? class_section
            end
          end
        }
      end

      # Make sure everyone finishes playing in their sandbox
      threads.each { |thread|
        thread.join
      }

      return schedule_set
    end

    # Generates a set of somewhat optimal schedules from specified user preferences and a set of available class sections 
    # using a genetic algorithm.
    #
    # Returns:
    #
    #   A set of schedules.
    #
    # Parameters: 
    #
    #   * +preferences+ - A collection of user specified preferences that help shape the set of schedules generated.
    #   * +class_section_set+ - A set of available class sections from which schedules can be generated.
    def self.evolve_schedules(preferences, class_section_set)
      convergence_tracker = 0
      best_top_individual_score = 0
      best_population_avg_score = 0
      
      population_snapshot = Set.new
      population = generate_schedules preferences, class_section_set

      while convergence_tracker < MAX_STALE_GENERATIONS
        population_copy = Set.new population
        # Progress the population through a generation and rank the population
        population = new_generation! population_copy, class_section_set
        purge_and_replace_invalid_schedules! population, class_section_set

        if population.size == 0 then
          throw Exception.new 'Zero population'
        end

        top_individual_score, population_avg_score = evaluate_population population
        # Check for population improvement
        if top_individual_score > best_top_individual_score
          # There was a change in the best individual, reset convergence tracker
          convergence_tracker = 0
          if population_avg_score > best_population_avg_score 
            # Population is the best we have seen, take snapshot
            best_top_individual_score = top_individual_score
            population_snapshot = Set.new population
          end
        else
          # No improvement was observed, mark for potential convergence
          convergence_tracker += 1
        end
      end
      return population_snapshot
    end
  end
end
