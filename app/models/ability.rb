class Ability 
  include CanCan::Ability
  
  def initialize(user)
    #ADMIN
    if user.role? :admin
      can :manage, :all
    end
    
    #MODERATOR
    
    #GUEST
     if user.role? :guest
       #User
       can :read, User
       can :update, User do |model|
         model.try(:id) == user.id
       end
       #Content (Page, Post)
       can :read, Content do |model|
         model.try(:published) == true || model.try(:id) == user.id
       end
       #UserSession
       can :manage, UserSession
       #can :manage, :all
     end
       
    
    #USER
     if user.role? :user
       #User
       can :read, User
       can :update, User do |model|
         model.try(:id) == user.id
       end
       #Content (Page, Post)
       can :read, Content do |model|
         model.try(:published) == true || model.try(:user_id) == user.id
       end
       can :update, Content do |model|
         model.try(:user_id) == user.id || model.try(:user_id) == user.id
       end
     end
       
       
    # if user.role? :user
      # can :destroy, :all do |obj_class, obj|
      #        obj.try(:user) == user 
      #        3.minutes.ago <= obj.created_at
      #      end
    
  end
end
