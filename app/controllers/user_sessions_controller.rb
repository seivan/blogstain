class UserSessionsController < ApplicationController
    #before_filter :new_user_session
    #authorize_resource
  def new
    @user_session = UserSession.new
    flash[:notice] = t("user_session.before_create")
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    #@user_session.attributes = params[:user_session]
    if @user_session.save
      flash[:success] = t("user_session.after_create")
      redirect_to(admin_dashboard_path)
      
    else
      flash[:failure] = t("user_session.fail_create")
      render :action => 'new'#, :controller => "Admin::UserSessions"
    end
  end

  def destroy
    if current_user_session.destroy
      flash[:notice] = t("user_session.after_destroy")
      redirect_to posts_path
    else
      flash[:failure] = t("user_session.fail_destroy")
      redirect_to current_user
    end
  end
  
  
end
