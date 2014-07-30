require 'rails_helper'
include GenScheduleHelper

describe MockSchedule do
  before :all do
    preference = build :preference
    @mock_schedule = MockSchedule.new preference
  end
  
  
  context '#new with a preference' do
    it 'takes a preference and creates a MockSchedule' do
      expect(@mock_schedule).to be_a MockSchedule
    end
    
    it 'has an empty class section set' do
      expect(@mock_schedule.class_section_set.emtpy?).to be true
    end
    
    it 'has an aggregate score of zero' do
      expect(@mock_schedule.aggregate_score).to eq(0)
    end
    
    it 'is invalid' do
      expect(@mock_schedule.is_valid?).to be false
    end
    it 'has a preference' do
      expect(@mock_schedule.preference).to be_truthy
    end
  end
    
  context '#assign_class_section! just once' do
    it 'has a non-empty class section set' do
      expect(@mock_schedule.class_section_set.empty?).to be false
    end
    
    it 'contains one class section' do
      expect(@mock_schedule.class_section_set.size).to eq(1)
    end
    
    it 'is still invalid' do
      expect(@mock_schedule.is_valid?).to be false
    end
    
    it 'still has an aggregate score of zero' do
      expect(@mock_schedule.aggregate_score).to eq(0)
    end
    
  end
      # evaluate!
      # fill_schedule!
      # class_section_set
      # aggregate_score
      # eql?
      # hash?
      # initialize?
      # assign_class_section!
      # unassign_class_section!
      # is_valid?
      # reset!
      # safe_assignment?
      # set_class_sections
      # preference  
end