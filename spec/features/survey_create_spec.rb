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
