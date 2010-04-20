class UserSessionsController < Admin::BaseController
    #before_filter :new_user_session
    authorize_resource

  def new
    @user_session = UserSession.new
    flash[:notice] = t("user_session.before_create")
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    #@user_session.attributes = params[:user_session]
    if @user_session.save
      flash[:notice] = t("user_session.after_create")
      current_user.role?(:admin) ? redirect_to(admin_dashboard_path) : redirect_to(root_path)
    else
      flash[:error] = t("user_session.failed_create")
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t("user_session.destroy_create")
    redirect_to posts_path
  end
  
  
end
