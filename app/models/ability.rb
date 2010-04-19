class Ability 
  include CanCan::Ability
  
  def initialize(user)
    
    if user.role? :admin
      can :manage, :all
    end
  
  
     if user.role? :guest

       can :update, User, :id => user.id
       can :index, Post, :published => true
       #cannot :show, Post, :published => true
       can :create, UserSession
     end
       
     if user.role? :user

       can :read, Content, :published => true
       can :update, Content, :user_id => user.id#, :created_at => (7.minutes.ago..Time.now)
       can :create, UserSession
     end
       
       
    # if user.role? :user
      # can :destroy, :all do |obj_class, obj|
      #        obj.try(:user) == user 
      #        3.minutes.ago <= obj.created_at
      #      end
    
  end
end
