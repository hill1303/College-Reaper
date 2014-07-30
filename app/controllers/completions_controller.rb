# The CompletionController is a basic RESTful controller that allow a logged-in user to edit the completed
# courses in their associated +completions+ table. They may add, remove and update courses and their associated
# grades. The controller also uses the autocomplete feature to aid the process of adding new courses to
# their history in a user-friendly manner.

class CompletionsController < ApplicationController
  # +index+ shows all of the completions for a given user
  def index
    @completions = Completion.where(user_id: current_user.id)
  end

  # +new+ allows a user to create a new completion
  def new
    @completion = Completion.new
  end

  # +show+ displays a single completion to the user
  def show
    @completion = Completion.find(params[:id])
  end

  # +edit+ allows a user to update their completed course grade
  def edit
    @completion = Completion.find(params[:id])
  end


  # Allows user to create new Completion
  def create
    params['completion']['user_id'] = current_user.id
    params['completion']['course_id'] = view_context.autocompleted_course_to_id params['completion']['course_id']
    completion = Completion.create(params['completion'].permit(:course_id, :grade, :user_id))
    redirect_to completion
  end


  # Allows user to update their Completion information
  def update
    completion = Completion.find(params[:id])
    params['completion']['course_id'] = view_context.autocompleted_course_to_id params['completion']['course_id']
    completion.update_attributes! params['completion'].permit(:id, :course_id, :grade)
    redirect_to completion
  end

  # +destroy+ a completion from user history
  def destroy
    @completion = Completion.find(params[:id])
    @completion.destroy
    redirect_to completions_url, notice: 'Completion was successfully destroyed.'
  end
end

