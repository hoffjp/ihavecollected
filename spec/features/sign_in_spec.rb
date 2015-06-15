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
  it "logs in a valid user" do
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
    expect(page).to have_link("Collections")
  end

  it "logs in a valid user (regardless of the case used to log-in)" do #This requires the email to be originally SAVED in downcase and later compared in downcase
    password = "123456789"
    email = "tester@testing.com"
    u = User.create( email: email, password: password, password_confirmation: password )

    visit new_user_session_path

    within "#new_user" do
      fill_in "user_email", with: "Tester@Testing.Com"
      fill_in "user_password", with: password
    end

    click_button "Log in"

    expect(page).to have_text("Log Out")
    expect(page).not_to have_text("Sign In")
    expect(page).to have_link("Collections")
end

#  User Login/Registratino (reloaded)
 #I am trying to learn a [new] leaner syntxt
	describe "User Registration " do
		before { visit (new_user_session_path) }

		context "Valid login" do 
			it "creates a user" do
				fill_in 'user_email', :with => "testing@test.com"
				fill_in 'user_password', with: "password"
				click_button("Log in")
				current_path.should =~ /user/
			end
		end

		context "empty values" do
			it "displays an error to the user" do
				click_button("Log in")
				expect(page).to have_text("fill out this")
			end
		end
	end
end
