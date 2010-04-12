class UsersController < ApplicationController
  respond_to :html, :js
  load_and_authorize_resource
  
  def new
    @user = current_user #the user might have any assossociation, this can be a good way.
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
        redirect_to posts_path
      else
        render 'new'
      end
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to posts_path
    else
      render 'edit'
    end
  end

end
