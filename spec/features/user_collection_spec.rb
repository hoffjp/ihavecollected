require 'rails_helper'

describe "User's Collections" do
  before(:each) do
    @user = User.create( email: "tester@testing.com", password: "12345678", password_confirmation: "12345678" )
  end

  it "there should be many" do
    @user.should have_many(:collections)
  end

end

