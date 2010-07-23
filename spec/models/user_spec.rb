require 'spec_helper'


describe User do
  let(:admin)        { Factory.create(:admin)        }
  let(:moderator)    { Factory.create(:moderator)    }
  let(:writer)       { Factory.create(:writer)       }
  let(:user)         { Factory.create(:user)         }
  let(:guest)        { Factory.create(:guest)        }
  let(:invalid_user) { Factory.create(:invalid_user) }
  let (:user_without_email) { Factory.create(:user, :email => nil)}
  let (:user_without_username) { Factory.create(:user, :username => nil)}

  context User, "protected attributes" do
    it { should_not allow_mass_assignment_of :role }
  end

  describe User, ".find_for_database_authentication" do 
    context "logging in with email" do 
      subject { User.find_for_database_authentication({:email => admin.email}) }
      it {should == admin }
    end

    context "logging in with username" do 
      subject { User.find_for_database_authentication({:email => admin.username}) }
      it {should == admin }    
    end
  end

  context User, "associations" do
    it { should have_many(:contents) }
  end

  context User, "validations for" do
    subject {user}
    
    context "username" do      
      it { should validate_uniqueness_of(:username) }
      it { should_not allow_value("s1").for(:username) }
      context "without email" do
        specify { user_without_email.should validate_presence_of(:username) }
      end
      
      context "with email" do
        specify { user_without_username.should_not validate_presence_of(:username) }
      end
      
    end

    context "email" do
      it{ should_not allow_value("blah").for(:email) }
      it{ should_not allow_value("roger@").for(:email) }
      it{ should_not allow_value("@ass.com").for(:email) }
      context "without username" do
        specify { user_without_username.should validate_presence_of(:email) }
      end
      context "with username" do
        specify { user_without_email.should_not validate_presence_of(:email) }
      end
    end

    describe "password" do
      it { should validate_presence_of(:password) }
      it { should_not allow_value("z1").for(:password) }
    end
  end


  describe User, "roles" do
    describe "#role_to_symbol" do
      specify {user.role_symbols.should == :user}
    end

    describe ".list_roles_without" do
      specify { User.list_roles_without(%w[moderator admin]).should == (User::ROLES-%w[moderator admin])}
    end

    describe "#roles_included _in?" do
      specify {user.role_included_in?(%w[moderator admin]).should be_false }
    end

    describe "::ROLES"
    specify {User::ROLES.sort.should == %W[admin moderator guest writer user].sort }
  end

end

