require 'rails_helper'

describe SurveysController do
  let!(:user) { User.create! email: "mrpants@example.com"}

  context "POST /surveys" do
    it "creates a new survey" do
      session[:user_id] = user.id
      expect {
        post :create, survey: { title: "Mr. Belevedere" }
      }.to change(Survey, :count).by(1)
    end
  end
end
