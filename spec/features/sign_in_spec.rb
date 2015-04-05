require 'rails_helper'

feature "Sign in", :type => :feature do
		it "is accessible from the landing page" do
		visit root_url
		click_link('Sign In')
		expect(page).to have_text('Log in')
	end

	it "includes prompt for email and password" do
		visit new_user_session_path
		expect(page).to have_selector('#user_email')
		expect(page).to have_selector('#user_password')
	end

	it "includes 'Rmemeber me' feature" do
		visit new_user_session_path
		expect(page).to have_selector('#user_remember_me')
	end

  # Test user login
  it "should login a valid user" do
    password = "123456789"
    email = "tester@testing.com"
    u = User.create( email: email, password: password, password_confirmation: password )

    visit new_user_session_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"

    expect(page).to have_text("Log Out")
    expect(page).not_to have_text("Sign In")
    expect(page).to have_link("New Collection")
  end

end
