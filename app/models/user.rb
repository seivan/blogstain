class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  #Validations
  validates :email, :email_format => true
  #Scopes
  scope :admin, where(:role => "admin")
  scope :users, where(:role => "user")
  scope :guests, where(:role => "guest")
  #Associations
  has_many :contents
  acts_as_authentic
  
end
