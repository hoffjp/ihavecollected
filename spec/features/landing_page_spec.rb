require 'rails_helper'

describe "Landing Page", pending: true do
	describe "Page Elements", pending: true do
		context "header" do
			it "includes a header" do
				visit '/'
				expect(page).to have_selector('h1')
				expect(page).to have_text('I Have Collected')
			end
		end
		context "footer" do
			it "includes a footer" do
				visit '/'
				expect(page).to have_selector('footer')
				expect(page).to have_text('2015')
			end
		end
		context "Navigation" do
			it "includes a navigation menu" do
				visit '/'
				expect(page).to have_link('About')
				expect(page).to have_link('Register')
				expect(page).to have_link('Sign In')
			end
		end
		context "Routing" do
			it "is the default (root) route" do
				visit '/'
				current_path.should eq(root_path)
			end
		end
	end
end
