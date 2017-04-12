class Api::FeedbacksController < ApplicationController
  before_action :set_feedback, only: :show

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.json { render :show, status: :created, location: api_feedback_url(@feedback) }
      else
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
