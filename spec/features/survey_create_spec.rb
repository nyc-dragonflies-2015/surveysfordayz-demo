require 'rails_helper'

feature 'User signs in' do
  given!(:user) { User.create(email: "mrpants666@example.com", password: "DevilPants") }

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
  end

  context "When the credentials are good" do
    it "lets a user sign in" do
      fill_in 'Password', with: user.password
      click_button 'Login'
      friendly_string = "Hello #{user.email}!"
      expect(page).to have_content friendly_string
    end
  end

  context "When the password is bad" do
    it "does not let a user without a valid password sign in" do
      fill_in 'Password', with: "I love jellybeans!"
      click_button 'Login'
      expect(page).to have_content "die in a fire!"
    end
  end
end
