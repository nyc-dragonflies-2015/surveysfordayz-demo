class SurveysController < ApplicationController
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      # uncomment once User stuff is set
      # @user = User.find_by(id: session[:user_id])
      # @user.surveys << @survey
      redirect_to @survey
    else
      redirect_to :back
    end
  end

  def show
    @survey = Survey.find_by(id: params[:id])
    @question = Question.new
    @choice = Choice.new
  end

  def take
    @survey = Survey.find(params[:id])
  end

  def submit
    user = User.find(session[:user_id]) # This must change if the current user can't be identified this way.
    survey = Survey.find(params[:id])

    taken_survey = TakenSurvey.create(user_id: user.id, survey_id: survey.id)

    params.each do |question, choice_id|
      if question.include?("question_")
        taken_survey.user_choices.build(choice_id: choice_id).save
      end
    end

    redirect_to "/surveys/new" # Must redirect this to the main page, once we know the route for it.
  end

  private
    def survey_params
      params.require(:survey).permit(:title)
    end
end
