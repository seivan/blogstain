class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable

  attr_accessible :username, :email, :password
  


  #Validations
  validates :email, 
            :email_format => { :if => lambda {self.username.blank?} },
            :presence => { :if => lambda {self.username.blank?} },
            :uniqueness => true
                        
  validates :username,
            :format => {:with => /[A-Za-z0-9]+/, :allow_blank => true},
            :presence => { :if => lambda {self.email.blank?} },
            :length => {:minimum => 3, :allow_blank => true},
            :uniqueness => true
            
  validates :role, 
            :inclusion => { :in => %w(admin moderator writer user guest) }
            
  validates :password,
            :length => {:minimum => 3}

  
  #Scopes
  scope :role_admin, where(:role => "admin")
  scope :role_writer, where(:role => "writer")
  scope :role_moderator, where(:role => "moderator")
  scope :role_user, where(:role => "user")
  scope :role_guest, where(:role => "guest")
  scope :after_role_desc, order("role DESC")
  
  #Associations
  has_many :contents
  
  def self.find_for_database_authentication(conditions)
     value = conditions[authentication_keys.first]
     conditions = ["username = ? or email = ?", value, value]
     User.where(conditions).first
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
