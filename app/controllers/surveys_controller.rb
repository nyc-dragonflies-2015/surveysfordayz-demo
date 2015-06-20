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
  end

  private
    def survey_params
      params.require(:survey).permit(:title)
    end
end
