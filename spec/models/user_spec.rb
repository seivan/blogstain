require 'spec_helper'
# 
# describe User do
#   let(:user) { Factory.create(:user) }
# 
#   describe User, "create" do
#     describe "with username and password" do
#       subject { Factory.build(:gser, :email => nil) }
#       it { should be_valid }
#     end
# 
#     describe "with email and password" do
#       subject { Factory.build(:User, :username => nil) }
#       it { should be_valid }
#     end
# 
#     describe "with the role of 'admin'" do
#       subject { Factory.build(:User, :role => "admin") }
#       it { should_not be_valid }
#     end
#   end
# 
#   describe User, "authentication" do
#     describe "with username and password" do
#       subject { User.authenticate(user.username, user.password) }
#       it { should == user }
#     end
# 
#     describe "with email and password" do
#       subject { User.authenticate(user.email, user.password) }
#       it { should == user }
#     end
# 
#     describe "with false credentials" do
#       subject { User.authenticate("Frank", "wrong") }
#       it { should be_nil }
#     end
# 
#     describe User, "role" do
#       subject { user.role }
#       it { should == "user" }
#     end
# end