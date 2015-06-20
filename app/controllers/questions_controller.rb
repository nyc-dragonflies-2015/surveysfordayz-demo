class QuestionsController < ApplicationController
  def create
    @question = Question.create(question_params)
    @choice = Choice.new
    redirect_to :back #double check this later
  end

  def form
    render partial: 'surveys/question', locals: { question: Question.new }
  end

  private
    def question_params
      params.require(:question).permit(:text, :survey_id)
    end
end
