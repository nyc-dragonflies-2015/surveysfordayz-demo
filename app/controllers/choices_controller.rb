class ChoicesController < ApplicationController
  def create
    @choice = Choice.create(choice_params)
    redirect_to :back
  end

  def destroy
    p params
    render plain: "hi"
  end

  private
    def choice_params
      params.permit(:text, :question_id)
    end
end
