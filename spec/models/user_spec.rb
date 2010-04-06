require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "value for username",
      :crypted_password => "value for crypted_password",
      :password_salt => "value for password_salt",
      :email => "value for email",
      :role => "value for role",
      :single_access_token => "value for single_access_token",
      :perishable_token => "value for perishable_token",
      :login_count => 1,
      :failed_login_count => 1,
      :last_request_at => Time.now,
      :current_login_at => Time.now,
      :last_login_at => Time.now,
      :current_login_ip => "value for current_login_ip",
      :last_login_ip => "value for last_login_ip"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  username            :string(255)     not null
#  email               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  role                :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

