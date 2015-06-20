class QuestionsController < ApplicationController
  def create
    @question = Question.create(question_params)
    binding.pry
    # @survey = Survey.find(params[:survey_id])
    # @survey.questions << @question
    redirect_to :back
  end

  private
    def question_params
      params.require(:question).permit(:text, :survey_id)
    end
end
