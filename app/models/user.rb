class User < ActiveRecord::Base
  attr_accessible :username, :email, :password#, :password_confirmation
  #Validations
  validates :email, :email_format => true
  #Scopes
  scope :admin, where(:role => "admin")
  scope :users, where(:role => "user")
  scope :guests, where(:role => "guest")
  #Associations
  has_many :contents
  acts_as_authentic do |config|
    #config.validate_password_field = false
    config.require_password_confirmation = false
    config.validate_password_field = false
    config.validate_email_field = false
  end

  ROLES = %w[admin user guest]
  def role_symbols
    role.to_sym
  end
  
  def role?(given_role)
    role == (given_role.to_s)
  end

  def activated_guest_into_user
    self.role = "user"
    if self.save
      true
    else
      false
    end
  end
  
end
