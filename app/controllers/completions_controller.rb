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

  # Create allows a user to store a new completion in the database
  def create
    @completion = Completion.new(params[:id])
  end

  # Updates existing completion in database
  def update
    @completion = Completion.find(params[:id])
    respond_to do |format|
      if @completion.update(params[:id])
        redirect_to @completion, notice: 'Completion was successfully updated.'
      else
        render :edit
      end
    end
  end

  # Removes a completion from user history
  def destroy
    @completion = Completion.find(params[:id])
    @completion.destroy
    redirect_to completions_url, notice: 'Completion was successfully destroyed.'
  end
end

