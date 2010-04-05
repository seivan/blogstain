class User < ActiveRecord::Base
  has_many :posts
  #has_many :comments, :as => :commentable
  
  after_update :activate_guest!
  acts_as_authentic do |session|
      session.logged_in_timeout = 30.days.from_now
  end
  is_gravtastic :email, :secure => true,
                        :filetype => :png,
                        :size => 120
                        
      

  ROLES = %w[admin moderator user guest]
  def role_symbols
    [roles.to_sym]
  end
  
  def role?(given_role)
    role == (given_role.to_s)
  end

  private
  def activate_guest!
      old_role = role
      self.role == "user"
      if old_role == "guest" && !(self.role? "guest")
          @user = "user"
          @user.save
          flash[:notice] = "Now a user"
      elsif (@user.role? "guest")
          flash[:notice] = "You are a guest"
      end
    end
end
