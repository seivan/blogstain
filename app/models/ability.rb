class Ability 
  include CanCan::Ability
  
  def initialize(user)
    
    if user.role? :admin
      can :manage, :all
    end
    
    if user.role? :moderator
      can :read, User
      #can :update, User, :role => user.role_included_in(ROLES-["admin", "moderator"])
      can :update, User, do |record|
        record.role_included_in?(ROLES-["admin", "moderator"]) || record.try(:id) == user.id
      end 
      can :update, Post, :user_id => user.id
      can :read, Page, :published => true
      can :read, Post, :published => true
    end
    
    if user.role? :writer
      can :update, User, :id => user.id
      can :create, Post
      can :update, Post, :user_id => user.id
      #can :read, Page, :published => true
      can :read, Page do |record|
        record.try(:published) == true || record.try(:user_id) == user.id
      end
      can :read, Post, :published => true
    end
    
    if user.role? :guest
       can :update, User, :id => user.id
       can :read, Page, :published => true
       can :read, Post, :published => true
       #cannot :show, Post, :published => true
       can :create, UserSession
     end
       
     if user.role? :user
       can :read, Page, :published => true
       can :read, Post, :published => true
       #can :update, Content, :user_id => user.id, :created_at => (7.minutes.ago..Time.now)
       can :create, UserSession
     end
       
       
    # if user.role? :user
      # can :destroy, :all do |obj_class, obj|
      #        obj.try(:user) == user 
      #        3.minutes.ago <= obj.created_at
      #      end
    
  end
end
