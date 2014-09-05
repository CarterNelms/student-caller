require 'test_helper'

RSpec.describe User, :type => :model do
  before do
    Fabricate(:user)
  end
  
  let!(:user){User.create(first_name: "John", last_name: "Smith")}

  context "Name" do
    it "should return the user's first and last names as a whole name" do
      expect(user.name).to eq "John Smith"
    end
  end
end
