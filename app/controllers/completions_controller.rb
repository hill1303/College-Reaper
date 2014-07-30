class CompletionsController < ApplicationController
  def index
    @completions = Completion.where(user_id: current_user.id)
  end

  def new
    @completion = Completion.new
  end
  
  def show
    @completion = Completion.find(params[:id])
  end

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

  def destroy
    @completion = Completion.find(params[:id])
    @completion.destroy
    redirect_to completions_url, notice: 'Completion was successfully destroyed.'
  end
end

