class UsersController < ApplicationController
  load_and_authorize_resource
  
  # def new
  #   @user = current_user #the user might have any assossociation, this can be a good way.
  #   flash[:notice] = t("user.before_create")
  #   respond_with @user
  # end
  
  def edit
    @user = current_user
    flash[:notice] = t("user.before_update")
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.activated_guest_into_user
      flash[:notice] = t("user.after_create")
      redirect_to posts_path
    else
      flash[:error] = t("user.fail_create")
      render 'edit'
    end
  end

end
