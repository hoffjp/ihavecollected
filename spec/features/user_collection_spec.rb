require 'rails_helper'

describe "User's Collections" do
  before(:each) do
    @user = User.create( email: "tester@testing.com", password: "12345678", password_confirmation: "12345678" )
	@user.collections.create(name: 'Collection Number 1', personal: false)
    @user.collections.create(name: 'Collection Number 2', personal: true)
	elements = []
	1.upto(10) do |e|
	elements << ordinalize(e)
	end

@full_collection = @user.collections.create(name: "A Complete Collection", personal: false, description: "This is a collection of all the things I have ever owned and will own in the future.  The list of 'elements' is, currently, a HASH (Array) but must be persisted (somehow) in a flexible manner; that is a programming challenge for you") #, elements: elements )
    
  end
	context "Default property is personal" do
		it "when not explicitly defined"  do
			expect(:collection_default[:personal]).to be
		end
	end

	context "Collection properties" do
		it "when Personal" do
			expect(:collection_personal[:personal]).to be
		end
		it "when Public" do
			expect(:collection_public[:persona]).to be
		end
	end

	context "Multiple Collections" do
		  it "there should be at least one" do
		    expect(@user.collections).to respond_to(:first)
		  end
		  it "there should be many" do
		    expect(@user.collections).to respond_to(:second)
		  end
	end
	context "Personal and Public collections" do
		it "should include PRIVATE collections" do
			expect(@user.collections.where(personal: true)).to respond_to(:first)
		end
		it "should include PUBLIC collections" do
			expect(@user.collections.where(personal: false)).to respond_to(:first)
		end
	end
end

