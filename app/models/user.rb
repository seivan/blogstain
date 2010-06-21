class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :login
  field :email
  field :role
  field :crypted_password
  field :password_salt
  field :persistence_token
  field :single_access_token
  field :perishable_token
  field :login_count, :default => 0
  field :failed_login_count, :default => 0
  field :last_login_at
  field :current_login_at
  field :last_login_ip
  field :current_login_ip
  field :oauth_token
  field :oauth_secret
  field :twitter_uid
  field :avatar_url
  field :name
  
  #Validations
  validates :email, :email_format => true
  #Scopes
  named_scope :role_admin, where(:role => "admin")
  named_scope :role_writer, where(:role => "writer")
  named_scope :role_moderator, where(:role => "moderator")
  named_scope :role_user, where(:role => "user")
  named_scope :role_guest, where(:role => "guest")
  #named_scope :after_role_desc, order("role DESC")
  #Associations
  #has_many :contents
  embeds_many :posts
  embeds_many :pages
  # acts_as_authentic do |config|
  #   config.require_password_confirmation = false
  #   config.validate_password_field = false
  #   config.validate_email_field = false
  # end

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

  def activated_guest_into_user?
    self.role = "user"
    if self.save
      true
    else
      false
    end
  end
  
end
