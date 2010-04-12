class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  #Validations
  validates :email, :email_format => true
  #Scopes
  
  #Associations
  has_many :contents
  acts_as_authentic
  
end
