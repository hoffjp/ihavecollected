require 'rails_helper'

describe "Landing Page" do
	it "includes a header" do
		visit '/'
		expect(page).to have_selector('h1')
		expect(page).to have_text('I Have Collected')
	end

	it "includes a footer" do
		visit '/'
		expect(page).to have_selector('footer')
		expect(page).to have_text('2015')
	end

	it "includes a navigation menu" do
		visit '/'
		expect(page).to have_link('About')
		expect(page).to have_link('Register')
		expect(page).to have_link('Sign In')
	end

	it "is the default (root) route" do
		visit '/'
		current_path.should eq(root_path)
	end
end
