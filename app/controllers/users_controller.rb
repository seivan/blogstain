class UsersController < ApplicationController
    load_and_authorize_resource
  
  def new
    @user = current_user #the user might have any child objects, this can be a good way.
  end
  
  def edit
    @user = current_user
    
  end
  
  def create
    if current_user
      update and return
    else
      if @user.save
        UserSession.create(@user,true)
        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def update
    @user = current_user
    @user.turn_guest_to_user!
    if @user.update_attributes(params[:user])
      redirect_to signup_path
    else
      render 'edit'
    end
  end

end
