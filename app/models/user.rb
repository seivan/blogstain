class User < ActiveRecord::Base
  has_many :posts
  #has_many :comments, :as => :commentable
  
  #after_update :turn_guest_to_user
  acts_as_authentic do |session|
      session.logged_in_timeout = 30.days.from_now
  end
  # is_gravtastic :email, :secure => true,
  #                       :filetype => :png,
  #                       :size => 120
                        
      

  ROLES = %w[admin moderator user guest]
  def role_symbols
    [ROLES.to_sym]
  end
  
  def role?(given_role)
    self.role == (given_role.to_s)
  end


  def turn_guest_to_user!
    if role == "guest"
      self.role = "user"
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

