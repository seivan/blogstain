class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable

  attr_accessible :username, :email, :password
  
  #Validations
  validates :email, 
            :email_format => { :allow_blank => true },
            :presence => { :if => lambda {self.username.nil?} },
            :uniqueness => true
                        
  validates :username,
            :format => {:with => /[A-Za-z0-9]+/, :allow_blank => true},
            :presence => { :if => lambda {self.email.nil?} },
            :length => {:minimum => 3, :allow_blank => true},
            :uniqueness => true
            
  validates :role, 
            :inclusion => { :in => %w(admin moderator writer user guest) }

  validates :password,
            :length => {:minimum => 3},
            :presence => true

  
  #Scopes
  # scope :role_desc, order("role DESC") 
  scope :created_at_desc, order("created_at DESC")
  #Associations
  has_many :contents
  
  def self.find_for_database_authentication(conditions)
     value = conditions[authentication_keys.first]
     conditions = ["username = ? or email = ?", value, value]
     User.where(conditions).first
  end
  
  #Virual Attributes
  
  def email_or_username
    self.email || self.username
  end
   
  #Roles
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

end
