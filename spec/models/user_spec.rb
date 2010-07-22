require 'spec_helper'


describe User do
  let(:admin)     { Factory.create(:admin)     }
  let(:moderator) { Factory.create(:moderator) }
  let(:writer)    { Factory.create(:writer)    }
  let(:user)      { Factory.create(:user)      }
  let(:guest)     { Factory.create(:guest)     }
  
  describe User, "find_for_database_authentication" do 
    describe User, "admin with email" do 
      subject { User.find_for_database_authentication({:email => admin.email}) }
      it {should == admin }
    end
  
    describe User, "admin with username" do 
      subject { User.find_for_database_authentication({:email => admin.username}) }
      it {should == admin }    
    end
  end
  
  describe User, "associations" do
    it { should have_many(:posts) }
  end
  
  describe User, "validations for" do
    describe User, "username" do
      subject {admin}
      it { should validate_uniqueness_of(:username) }
      it { should validate_presence_of(:username) }
    end
    describe User, "email" do
      it { should validate_uniqueness_of(:email) }
      it { should validate_presence_of(:email) }
      it{ should_not allow_value("blah").for(:email) }
    end
    describe User, "password" do
      it { should validate_presence_of(:password) }
      it { should_not allow_value("z1").for(:password) }
    end
  end

  
    
  describe User, "roles" do
    describe User, "roles to symbol" do
     specify {user.role_symbols.should == :user}
    end
    
    describe User, "list roles without" do
     specify { User.list_roles_without(%w[moderator admin]).should == (User::ROLES-%w[moderator admin])}
    end
    describe User, "roles included in?" do
      specify {user.role_included_in?(%w[moderator admin]).should be_false }
    end
    describe User, "ROLES"
      specify {User::ROLES.sort.should == %W[admin moderator guest writer user].sort }
  end
end
 
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
# 
# 
