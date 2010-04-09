class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  #Scopes
  
  #Associations
  has_many :contents
  acts_as_authentic
  
end
