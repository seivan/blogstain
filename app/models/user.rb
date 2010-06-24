class User
  include Mongoid::Document
  # @attr_accessible :email, :password, :password_confirmation@
  #   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :lockable, :token_authenticatable
  field :name

  include Mongoid::Timestamps
  
  #Validations
  validates :email, :email_format => true
  validates_presence_of :name, :case_sensitive => false
  
  #Scopes
  scope :role_admin, where(:role => "admin")
  scope :role_writer, where(:role => "writer")
  scope :role_moderator, where(:role => "moderator")
  scope :role_user, where(:role => "user")
  scope :role_guest, where(:role => "guest")
  #named_scope :after_role_desc, order("role DESC")
  #Associations
  #has_many :contents
  embeds_many :posts
  embeds_many :pages


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
