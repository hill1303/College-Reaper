require 'set'
class SheduleGenHelper

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