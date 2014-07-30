require 'set'

module GenScheduleHelper
  # The MockSchedule class represents a simple mock-up of a Schedule's content for the purpose of generating and
  # evaluating Schedules for a User based on specified preferences.
  class MockSchedule

    DAYS_OF_THE_WEEK = ["U", "M", "T", "W", "R", "F", "S"]
    RADIUS_OF_EARTH = 6371
    SAME_LOCATION_DISTANCE = 0.001
    DISTANCE_BIAS_FACTOR = 100

    attr_reader :class_section_set
    attr_reader :aggregate_score

    @preferences = nil

    # Initialize an empty MockSchedule with a set of user preferences.
    #
    # Parameters:
    #
    #   * +preferences+ - The +hstore+ preferences object that corresponds to the users preferences.
    def initialize(preferences)
      @preferences = preferences
      @class_section_set = Set.new
      @aggregate_score = 0
      @time_score = 0
      @distance_score = 0
      @ge_major_score = 0
      @credit_hour_score = 0
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
    
    def inspect
      [@aggregate_score, @time_score, @distance_score, @ge_major_score, @credit_hour_score].join(', ').to_s
    end

    # Returns a reference to the class level +hstore+ preferences object that was used to create +self+.
    #
    # Returns:
    #
    #   An +hstore+ preferences object.
    def preferences
      @preferences
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
    #   +true+ if +self+ is a full schedule, has an acceptable number of credit hours (as specified in +preferences+),
    #   and contains all explicitly named courses, if any (as specified in +preferences+). +false+ if none of these
    #   conditions are met.
    def is_valid?
      is_full? @preferences, @class_section_set and not contains_course_conflict? @class_section_set and 
        acceptable_credit_hours? @preferences, @class_section_set and 
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
      @time_score = time_score @preferences, @class_section_set
      @distance_score = distance_score @preferences, @class_section_set
      @ge_major_score = ge_major_score @preferences, @class_section_set
      @credit_hour_score = credit_hour_score @preferences, @class_section_set
      
      @aggregate_score = @time_score + @distance_score + @ge_major_score + @credit_hour_score
    end

    # Resets +self+'s class section set with a new, random, and full class section set.
    #
    # Returns:
    #
    #   The result of +fill_schedule!+, +true+ if the schedule could be filled using +class_section_set+,
    #   +false+ otherwise.
    def reset!(class_section_set)
      @class_section_set = Set.new
      section_shuffle = class_section_set.to_a.shuffle
      fill_schedule! section_shuffle.to_set
    end

    # Replaces +self+'s class section set with that of +class_section_set+. This does _not_ guarantee that +self+ will be valid after
    # replacement.
    #
    # Parameters:
    #
    #   * +class_section_set+ - The class section set that will replace +self+'s class section set.
    def set_class_sections(class_section_set)
      @class_section_set = Set.new class_section_set
    end
    
    private
    
    def share_day?(class_section, other_class_section)
      # Substring hand-waving, check if the repeat pattern of a section has any matching days with the other sections
      class_section.rpt_pattern.scan(/./).any? { |day| other_class_section.rpt_pattern.include? day }
    end
    
    def course_times_overlap?(class_section, other_class_section)
      if class_section.start_time > other_class_section.end_time or
          class_section.end_time < other_class_section.start_time
        return false
      else
        return true
      end
    end

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

    def course_safe?(class_section_set, class_section)
      class_section_set.each do |scheduled_class_section|
        return false if scheduled_class_section.course_id == class_section.course_id
      end
      return true
    end

    def total_credit_hours_of(class_section_set)
      total_credit_hours = 0
      class_section_set.each { |class_section| total_credit_hours += class_section.course.credit_hours }
      return total_credit_hours
    end

    def get_named_courses_from(preferences)
      named_courses = Set.new
      preferences.choices.keys.each do |key|
        if key.to_s.match(/course[0-9]+/) 
          named_courses.add preferences.choices[key] 
        end
      end
      return named_courses
    end

    def contains_explicit_courses?(preferences, class_section_set)
      # Get set of explicitly named courses
      named_courses = get_named_courses_from preferences
      scheduled_courses = Set.new
      class_section_set.each do |class_section|
        scheduled_courses.add class_section.course 
      end
      return named_courses.subset? scheduled_courses
    end

    def acceptable_credit_hours?(preferences, class_section_set)
      schedule_total = total_credit_hours_of class_section_set
      # Get credit hour range from prefs
      credit_min = preferences.credit_min.to_i
      credit_max = preferences.credit_max.to_i
      schedule_total.between? credit_min, credit_max
    end

    def is_full?(preferences, class_section_set)
      return class_section_set.size == preferences.num_courses.to_i
    end
  
    def time_score(preferences, class_section_set)
      # Get time range from preferences
      start_time_pref = (Time.new preferences.start_time).utc.strftime( "%H%M%S%N" )
      end_time_pref = (Time.new preferences.end_time).utc.strftime( "%H%M%S%N" )
      # Get weight of importance for time
      time_pref_weight = preferences.time_weight.to_f
      classes_in_range = 0
      class_section_set.each do |class_section|
        class_start_time = class_section.start_time.utc.strftime( "%H%M%S%N" )
        class_end_time = class_section.end_time.utc.strftime( "%H%M%S%N" )
        if (start_time_pref <= class_start_time) and
            (end_time_pref >= class_end_time)
          classes_in_range += 1
        end
      end
      return time_pref_weight * classes_in_range
    end

    # Based on Equirectangular approximation distance, distance is in Kilometers
    def calculate_distance(location, other_location)
      x = (other_location.lonlat.x - location.lonlat.x) * Math.cos((location.lonlat.y + other_location.lonlat.y) / 2)
      y = other_location.lonlat.y - location.lonlat.y
      distance = Math.sqrt(x**2 + y**2) * RADIUS_OF_EARTH
      if distance != 0
        return distance
      else
        return SAME_LOCATION_DISTANCE
      end
    end
    
    def total_distance_of(class_sections_on_day)
      distance = 0
      # Calculate distance by class_section pairs in sorted list
        (class_sections_on_day.size - 1).times do |i|
          location = class_sections_on_day[i].location
          other_location = class_sections_on_day[i+1].location
          distance += calculate_distance location, other_location
        end
    end

    def sorted_classes_on(day, class_section_set)
      # Find all class_sections that occur on day
      classes_on_day = class_section_set.select { |class_section| class_section.rpt_pattern.include? day }
      # Sort list of classes by time
      classes_on_day.to_a.sort! do |class_section, other_class_section|
        class_section.start_time <=> other_class_section.start_time
      end
    end
  
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
      return (distance_pref_weight / week_total) / DISTANCE_BIAS_FACTOR
    end
    
    def count_ge_courses(preferences, class_section_set)
      num_ge_classes = 0
      # sum of classes that come from gen course group
      preferences.user.course_groups.where(college_independent: false).each do |major|
        major.college.course_groups.where(college_global: true).each do |course_group|
          class_section_set.each do |class_section|
            if course_group.courses.include? class_section.course
              num_ge_classes += 1
            end
          end
        end
      end
      return num_ge_classes
    end
    
    def count_major_courses(preferences, class_section_set)
      num_major_classes = 0
      # sum of classes that come from major course group
      preferences.user.course_groups.where(college_global: false).each do |course_group|
        class_section_set.each do |class_section|
          if course_group.courses.include? class_section.course
            num_major_classes += 1
          end
        end
      end
      return num_major_classes
    end
    
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

  
  class ScheduleGenerator

    MUTATION_RATE = 0.02
    RANDOM_SELECTION_RATE = 0.10
    MAX_STALE_GENERATIONS = 3
    MAX_POPULATION_SIZE = 500
    
    def mutate!(schedule, class_section_set)
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

    def exchange_genes!(schedule, other_schedule)
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

    def new_generation!(schedule_set, class_section_set)
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

    def select_mate(schedule, schedule_set)
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

    def evaluate_population(schedule_set)
      schedule_list = schedule_set.to_a
      schedule_list.sort! { |a,b| b.aggregate_score <=> a.aggregate_score }
      top_individual_score = schedule_list.first.aggregate_score
      score_sum = 0
      schedule_set.each { |schedule| score_sum += schedule.aggregate_score }
      avg = score_sum / schedule_set.size
      return top_individual_score, avg
    end

    def generate_schedules_easy(preferences, class_section_set)
      schedules = Set.new
      class_section_list = class_section_set.to_a
      # Create a set of valid possible schedules with a cap set to prevent long computation time
      class_section_list.combination preferences.num_courses.to_i do |possible_schedule|
        schedule = MockSchedule.new(preferences)
        schedule.set_class_sections possible_schedule
        
        if schedule.is_valid?
          schedule.evaluate!
          schedules.add? schedule
        end
        break if schedules.size >= MAX_POPULATION_SIZE
      end
      return schedules
    end
    
    def purge_and_replace_invalid_schedules!(schedule_set, class_section_set)
      schedule_set.each do |schedule|
        unless schedule.is_valid?
          schedule.reset! class_section_set
          schedule.evaluate!
        end
      end
      return schedule_set
    end
    
    def generate_schedules(preferences, class_section_set)
      schedule_set = Set.new
      # Make a copy of the class section set so that we can delete visited class sections
      class_section_set_copy = Set.new(class_section_set)
      class_section_set_copy.each do |class_section|
        schedule = MockSchedule.new preferences
        schedule.fill_schedule! class_section_set_copy
        if schedule.is_valid?
          schedule.evaluate!
          schedule_set.add? schedule
          # Delete the section, preventing generation from possibly starting with that section again
          class_section_set_copy.delete? class_section
        end
      end
      return schedule_set
    end

    def evolve_schedules(preferences, class_section_set)
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
        
        top_individual_score, population_avg_score = evaluate_population population

        # Check for population improvement
        if top_individual_score > best_top_individual_score
          # There was a change in the best individual, reset convergence tracker
          convergence_tracker = 0
          if top_individual_score > best_top_individual_score
            # Population is the best we have seen, take snapshot
            puts [population.size, top_individual_score, population_avg_score].join(', ')
            best_top_individual_score = top_individual_score
            best_population_avg_score = population_avg_score
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