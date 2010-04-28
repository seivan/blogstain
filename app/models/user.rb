class User < ActiveRecord::Base
  attr_accessible :username, :email, :password#, :password_confirmation
  #Validations
  validates :email, :email_format => true
  #Scopes
  scope :admin, where(:role => "admin")
  scope :writer, where(:role => "writer")
  scope :moderator, where(:role => "moderator")
  scope :users, where(:role => "user")
  scope :guests, where(:role => "guest")
  scope :after_role_desc, order("role DESC")
  #Associations
  has_many :contents
  acts_as_authentic do |config|
    config.require_password_confirmation = false
    config.validate_password_field = false
    config.validate_email_field = false
  end

  ROLES = %w[admin writer moderator user guest]
  def role_symbols
    role.to_sym
  end
  
  def self.list_roles_without(excluded_roles)
    ROLES-excluded_roles
  end
  def role?(given_role)
    role == (given_role.to_s)
  end
  
  def role_included_in?(roles)
    roles.any? do |role| 
      role==self.role 
    end
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
