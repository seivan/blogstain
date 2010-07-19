require 'spec_helper'


describe User do
  let(:admin)     { Factory.create(:admin)     }
  let(:moderator) { Factory.create(:moderator) }
  let(:writer)    { Factory.create(:writer)    }
  let(:user)      { Factory.create(:user)      }
  let(:guest)     { Factory.create(:guest)     }
  
  describe User, "associations" do
    should have_many(:posts)
    should have_many(:pages)
  end
  describe User, "validations" do
    should validate_uniqueness_of(:username)
    should validate_uniqueness_of(:email)
    should validate_presence_of(:username)
    should validate_presence_of(:email)
    should validate_presence_of(:password)
    
    should_not allow_value("blah").for(:email)
    should_not allow_value("z1").for(:username)
    should_not allow_value("z1").for(:password)
  end
end

# 
#   describe Account, "create" do
#     describe "with username and password" do
#       subject { Factory.build(:account, :email => nil) }
#       it { should be_valid }
#     end
# 
#     describe "with email and password" do
#       subject { Factory.build(:account, :username => nil) }
#       it { should be_valid }
#     end
# 
#     describe "with the role of 'admin'" do
#       subject { Factory.build(:account, :role => "admin") }
#       it { should_not be_valid }
#     end
#   end
# 
#   describe Account, "authentication" do
#     describe "with username and password" do
#       subject { Account.authenticate(user.username, user.password) }
#       it { should == user }
#     end
# 
#     describe "with email and password" do
#       subject { Account.authenticate(user.email, user.password) }
#       it { should == user }
#     end
# 
#     describe "with false credentials" do
#       subject { Account.authenticate("Frank", "wrong") }
#       it { should be_nil }
#     end
# 
#     describe Account, "role" do
#       subject { user.role }
#       it { should == "user" }
#     end
# end