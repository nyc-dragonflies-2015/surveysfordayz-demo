class QuestionsController < ApplicationController
  def create
    binding.pry
    @question = Question.create(question_params)
    @choice = Choice.new
    redirect_to :back #double check this later
  end

  private
    def question_params
      params.require(:question).permit(:text, :survey_id)
    end
end
