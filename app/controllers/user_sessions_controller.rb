class UserSessionsController < ApplicationController
   load_and_authorize_resource

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to signup_path
    else
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to signup_path
  end
  
end
