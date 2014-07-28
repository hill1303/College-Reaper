require 'set'
module GenScheduleHelper
  # The MockSchedule class represents a simple mock-up of a Schedule's content for the purpose of generating and
  # evaluating Schedules for a User based on specified preferences.
  class MockSchedule
  
    DAYS_OF_THE_WEEK = ["U", "M", "T", "W", "R", "F", "S"]
    RADIUS_OF_EARTH = 6371
    SAME_LOCATION_DISTANCE = 0.001
  
    attr_reader :class_section_set
    attr_reader :aggregate_score
  
    @@preferences = nil
    
    # Initialize an empty MockSchedule with a set of user preferences.
    # 
    # Parameters:
    #   
    #   * +preferences+ - The +hstore+ preferences object that corresponds to the users preferences. This value is set
    # at a class level and will not change once a MockSchedule has been instantiated.
    def initialize(preferences)
      @@preferences ||= preferences
      @class_section_set = Set.new
      @aggregate_score = 0
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
  
    # Returns a reference to the class level +hstore+ preferences object that was used to create +self+ and other
    # MockSchedules.
    #
    # Returns:
    #
    # An +hstore+ preferences object.
    def preferences
      @@preferences
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
    # * +class_section+ - The class section to be removed from +self+.
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
      is_full? and acceptable_credit_hours? and contains_explicit_courses?
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
      time_safe? class_section and course_safe? class_section and not is_full?
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
      return true if is_valid?
      for class_section in class_section_set
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
      @aggregate_score = time_score + distance_score + ge_major_score + credit_hour_score
      return @aggregate_score
    end
  
    # Resets +self+'s class section set with a new, random, and full class section set.
    #
    # Returns:
    #
    #   The result of +fill_schedule!+, +true+ if the schedule could be filled using +class_section_set+,
    #   +false+ otherwise.
    def reset!(class_section_set)
      @class_section_set = Set.new
      return fill_schedule! class_section_set
    end
  
    # Replaces +self+'s class section set with that of +class_section_set+. This does _not_ guarantee that +self+ will be valid after
    # replacement.
    #
    # Parameters:
    #
    #   * +class_section_set+ - The class section set that will replace +self+'s class section set.
    def set_class_sections(class_section_set)
      @class_section_set = Set.new(class_section_set)
    end
  
    private
  
    def time_safe?(class_section)
      # Substring hand-waving, check if the repeat pattern of a section has any matching days with the other sections
      for scheduled_class_section in @class_section_set
        if class_section.rpt_pattern.scan(/./).any? { |day| scheduled_class_section.rpt_pattern.include? day }
          # Now check for time conflicts, ie not non-conflicting times
          if not scheduled_class_section.start_time > class_section.end_time or
          scheduled_class_section.end_time < class_section.start_time
          return false
          end
        end
      end
      return true
    end
  
    def course_safe?(class_section)
      @class_section_set.any? do |scheduled_class_section|
        return scheduled_class_section.course_id == class_section.course_id
      end
      return true
    end
  
    def total_credit_hours
      total_credit_hours = 0
      @class_section_set.each { |class_section| total_credit_hours += class_section.course.credit_hours }
      return total_credit_hours
    end
  
    def contains_explicit_courses?
      # Get set of explicitly named courses
      named_courses = Set.new
      @@preferences.choices.keys.each do |key|
        if key.to_s.match(/course[0-9]+/)
        named_courses.add(@@preferences.choices[key])
        end
      end
      scheduled_courses = Set.new
      @class_section_set.each do |class_section|
        scheduled_courses.add(class_section.course)
      end
      return named_courses.subset? scheduled_courses
    end
  
    def acceptable_credit_hours?
      schedule_total = total_credit_hours
      # Get credit hour range from prefs
      credit_min = @@preferences.choices[:credit_min]
      credit_max = @@preferences.choices[:credit_max]
  
      schedule_total.between?(credit_min, credit_max)
    end
  
    def is_full?
      return @class_section_set.size == @@preferences.choices[:num_courses]
    end
  
    def time_score
      # Get time range from preferences
      start_time_pref = @@preferences.choices[:start_time]
      end_time_pref = @@preferences.choices[:end_time]
      # Get weight of importance for time
      time_pref_weight = @@preferences.choices[:time_weight]
  
      classes_in_range = 0
      @class_section_set.each do |class_section|
        if start_time_pref <= class_section.start_time and
        end_time_pref >= class_section.end_time
        classes_in_range += 1
        end
      end
      return time_pref_weight * classes_in_range
    end
  
    # Based on Equirectangular approximation distance, distance is in Kilometers
    def calculate_distance(location, other_location)
      x = (other_location.latlong.lon - location.latlong.lon) * Math.cos((location.latlong.lat + other_location.latlong.lat) / 2)
      y = other_location.latlong.lat - location.latlong.lat
      distance = Math.sqrt(x**2 + y**2) * RADIUS_OF_EARTH
      if distance != 0
      return distance
      else
        return SAME_LOCATION_DISTANCE
      end
    end
  
    def distance_score
      # Get weight of importance for distance
      distance_pref_weight = @@preferences.choices[:distance_weight]
  
      day_sums = Hash.new(0)
      DAYS_IN_WEEK.each do |day|
      # Find all class_sections that occur on day
        classes_on_day = @class_section_set.select { |class_section| class_section.rpt_pattern.include? day }
        # Sort list of classes by time
        classes_on_day = classes_on_day.to_a.sort! do |class_section, other_class_section|
          class_section.start_time <=> other_class_section.start_time
        end
        # Calculate distance by class_section pairs in sorted list
        (0...classes_on_day.size).each do |i|
          location = classes_on_day[i].location
          other_location = classes_on_day[i+1].location
          # Assign distance score sum to day in day_sums
          day_sums[day] += calculate_distance(location, other_location)
        end
      end
      # Sum the total distance traveled in the whole week
      week_total = 0
      day_sums.each { |day, sum| week_total += sum }
      # Really this is weight * (1/total_distance). (1/distance) is used to "punish" high and "reward" small distances
      return distance_pref_weight / week_sum
    end
  
    def ge_major_score
      ge_major_pref_weight = @@preferences.choices[:ge_major_lean_weight]
      ge_major_pref_lean = @@preferences.choices[:ge_major_lean]
  
      classes_in_pref = 0
      if ge_major_pref_lean == 'ge'
        # sum of classes that come from gen course group
        @@preferences.user.course_groups.where(college_global: true, college_independent: false).each do |course_group|
          @class_section_set.each do |class_section|
            if course_group.courses.include? class_section.course
            classes_in_pref += 1
            end
          end
        end
      elsif ge_major_pref_lean == 'major'
        # sum of classes that come from major course group
        @@preferences.user.course_groups.where(college_global: false).each do |course_group|
          @class_section_set.each do |class_section|
            if course_group.courses.include? class_section.course
            classes_in_pref += 1
            end
          end
        end
      end
      return ge_major_pref_weight * classes_in_pref
    end
  
    def credit_hour_score
      schedule_credit_hours = total_credit_hours
      credit_pref_weight = @@preferences.choices[:credit_lean_weight]
      credit_pref_lean = @@preferences.choices[:credit_lean]
      if credit_pref_lean == 'low'
        return credit_pref_weight / abs(schedule_credit_hours - @@preferences.choices[:credit_min])
      elsif credit_pref_lean == 'high'
        return credit_pref_weight / abs(schedule_credit_hours - @@preferences.choices[:credit_max])
      end
      return 0
    end
  end
  
  class ScheduleGenerator
  
    MUTATION_RATE = 0.02
    RANDOM_SELECTION_RATE = 0.10
    MAX_STALE_GENERATIONS = 5
    
    
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
      num_genes_to_swap = (1...schedule.class_section_set.size).to_a.sample
      
      schedule_swap = schedule.class_section_set.to_a.sample num_genes_to_swap
      other_schedule_swap = other_schedule.class_section_set.to_a.sample num_genes_to_swap
      
      # Remove the genes to be swapped from their original gene sequence...
      schedule.class_section_set.subtract(schedule_swap)
      other_schedule.class_section_set(other_schedule_swap)
      
      # ...and insert them into the other gene sequence
      schedule.class_section_set.merge(other_schedule_swap)
      other_schedule.class_section_set.merge(schedule_swap)
      
      return schedule, other_schedule
    end
  
    def new_generation!(schedule_set, class_section_set)
      
      new_generation = Set.new
      
      schedule_set.each do |schedule|
        # Remove the schedule from the population temporarily
        schedule_set.delete? schedule
        # Select a mate for the schedule (removes mate from the population, if it exists)
        mate = select_mate!(schedule, schedule_set)
        # If a schedule does not have a mate, it is likely the worst schedule and should be deleted
        if not mate.nil?        
          # Breed the two schedules and mutate the children
          child1, child2 = exchange_genes!(schedule, mate)
          mutate! child1
          mutate! child2
        
          if not child1.is_valid?
            child1.reset! class_section_set
          end
          if not child2.is_valid?
            child1.reset! class_section_set
          end
          child1.evaluate!
          child2.evaluate!
        
          new_generation.add? child1
          new_generation.add? child2
        end
      end
      return new_generation
    end
    
    def select_mate(schedule, schedule_set)   
      # Convert the schedule set to an array simply for using the sample method
      schedule_list = schedule_set.to_a
      if Random.rand <= RANDOM_SELECTION_RATE
        random_mate = schedule_list.sample
        schedule_set.delete? random_mate
        return random_mate
      else
        schedule_list.sort! { |a,b| a.aggregate_score <=> b.aggregate_score }
        schedule_index = schedule_list.index schedule
        mate = schedule_list[schedule_index + 1]
        schedule_set.delete? mate
        return mate
      end
    end
    
    def evaluate_population(schedule_set)
      schedule_list = schedule_set.to_a
      schedule.sort! { |a,b| a.aggregate_score <=> b.aggregate_score }
      top_individual_score = schedule_list[0].aggregate_score
      
      score_sum = 0
      schedule_set.each { |schedule| score_sum += schedule.aggregate_score }
      avg = score_sum / schedule_set.size
      
      return top_individual_score, avg
    end
    
    def generate_schedules_easy(class_section_set, preferences)
      schedules = Set.new
      class_section_list = class_section_set.to_a
      
      class_section_list.combination(preferences.choices[:num_courses]) do |possible_schedule|
        schedule = MockSchedule.new(preferences)
        schedule.set_class_sections possible_schedule
        if schedule.is_valid?
          schedule.evaluate!
          schedules.add?(schedule) 
        end
      end    
      return schedules
    end
    
    def generate_schedules(class_section_set, preferences)
      class_section_set_copy = Set.new(class_section_set)
      
      schedule_set = Set.new
      
      class_section_set_copy.each do |class_section|
        schedule = MockSchedule.new(preferences)
        schedule.fill_schedule! class_section_set_copy
        schedule.evaluate!
        schedule_set.add?(schedule)
        class_section_set_copy.delete? class_section
      end
      return schedule_set
    end
    
    def evolve_schedules(class_section_set)
      
      convergence_tracker = 0
      best_top_individual_score = 0
      best_population_avg_score = 0
      
      population_snapshot = Set.new
      population = generate_schedules(class_section_set, preferences)
      
      while convergence_tracker < MAX_STALE_GENERATIONS
        new_generation = new_generation!(population, class_section_set)
        top_individual_score, population_avg_score = evaluate_population new_generation
        
        if top_individual_score > best_top_individual_score
          # There was a change in the best individual, reset convergence tracker
          convergence_tracker = 0
          if population_avg_score > best_top_individual_score
            # Population is the best we have seen, take snapshot
            population_snapshot = Set.new(new_generation)
          end
        else
          convergence_tracker += 1
        end       
      end
      return population_snapshot
    end
  end
end