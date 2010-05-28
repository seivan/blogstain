require 'spec_helper'

describe User do
  it "creates a user" do
    user = User.make(:user)
    user.role.should eql"user"
  end
  
  it "creates an admin" do
    admin = User.make(:admin)
    admin.role.should eql"admin"
  end
end
