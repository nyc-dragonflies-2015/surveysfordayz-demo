require 'rails_helper'

describe SessionsController do
  describe "GET /new" do
    it "should render a form for signing in" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST /sessions" do
    let!(:user) { User.create :email => "natas@hairybug.com", :password => "love" }

    it "sign me in with the correct credentials" do
      post :create, user: { email: user.email, password: user.password }
      expect(response).to redirect_to(user)
    end

    it "NOT sign me in with the incorrect credentials" do
      post :create, user: { email: user.email, password: "Hatred" }
      expect(response).to redirect_to(root_path)
    end
  end
end
