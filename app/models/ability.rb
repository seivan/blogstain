class Ability 
  include CanCan::Ability
  
  def initialize(user)
    can :manage, :all
    # if user.role? :admin
    #   can :manage, :all
    # end
    # 
    # if user.role? :moderator
    #   can :manage, :all
    # end
    # 
    # if user.role? :user
    #   # can :destroy, :all do |obj_class, obj|
    #   #        obj.try(:user) == user 
    #   #        3.minutes.ago <= obj.created_at
    #   #      end
    #   can :destroy, UserSession do |us|
    #     user == us.try(:user)
    #   end
    # 
    # end
    # 
    # if user.role? :guest
    #   can :read, :all
    #   can :create, UserSession
    #   can :create, User
    #   can :update, User
    # end
    
  end
end
