class SessionsController < ApplicationController#Devise::SessionsController
  #before_filter :log_out_current_user, :only => [:new, :destroy]

  def new
    if current_user
      flash[:failure] = t("user_session.after_destroy")
      sign_out current_user
    end
    flash[:notice] = t("user_session.before_create")
  end


  def create
    warden.authenticate()
    if current_user
      flash[:success] = t("user_session.after_create")
      redirect_to admin_dashboard_path
    else
      flash[:failure] = t("user_session.fail_create")
      render :new
    end
  end


  def destroy
    # sign_out_and_redirect(resource_name)
    sign_out current_user if current_user
    if current_user
      flash[:failure] = t("user_session.fail_destroy")
      redirect_to admin_dashboard_path
    else
      flash[:notice] = t("user_session.after_destroy")
      redirect_to posts_path
    end
  end
  
end