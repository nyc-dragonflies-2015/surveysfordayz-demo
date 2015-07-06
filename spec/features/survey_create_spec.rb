require 'rails_helper'

feature 'User signs in' do
  given!(:user) { User.create(email: "mrpants666@example.com", password: "DevilPants") }

  it "lets a user sign in" do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    friendly_string = "Hello #{user.email}!"
    expect(page).to have_content friendly_string
  end

end

feature "Logging in with bad credentials says bad things" do
  given!(:user) { User.create(email: "mrpants666@example.com", password: "DevilPants") }
  it "does not let a user without a valid password sign in" do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "I love jellybeans!"
    click_button 'Login'
    expect(page).to have_content "die in a fire!"
  end
end
