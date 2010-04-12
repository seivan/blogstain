class UsersController < ApplicationController

  load_and_authorize_resource
  
  def new
    @user = current_user #the user might have any assossociation, this can be a good way.
    flash[:notice] = t("user.before_create")
    respond_with @user
  end
  
  def edit
    @user = current_user
    flash[:notice] = t("user.before_update")
  end
  
  def create
    if current_user
      update and return
    else
      if @user.save
        UserSession.create(@user,true)
        flash[:notice] = t("user.after_create")
        redirect_to posts_path
      else
        flash[:error] = t("user.fail_create")
        render 'new'
      end
    end
  end

  def update
    @user = current_user
    if @user.activated_guest_into_user
      flash[:notice] = t("user.after_create")
      redirect_to posts_path
    else
      flash[:error] = t("user.fail_create")
      render 'edit'
    end
  end

end
