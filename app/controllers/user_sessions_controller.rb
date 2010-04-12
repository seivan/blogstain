class UserSessionsController < ApplicationController
    load_and_authorize_resource

  def new
    @user_session = UserSession.new
    flash[:notice] = t("user_session.before_create")
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t("user_session.after_create")
      redirect_to signup_path
    else
      flash[:error] = t("user_session.failed_create")
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t("user_session.destroy_create")
    redirect_to signup_path
  end
  
end
