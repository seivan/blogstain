class Admin::UsersController <  Admin::BaseController
  authorize_resource
  respond_to :html, :json, :js
  def index
    @users = User.accessible_by(current_ability, :index).after_role_desc
  end
  
  def show
    @user = User.find_by_id params[:id]
    if @user.blank?
      flash[:error] = t("user.not_found") 
      respond_with @user, :admin
    else
      respond_with @user, :admin
    end
  end
  
  def new
    @user = User.new
    flash[:notice] = t("user.before_create")
    respond_with @user, :admin
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = t("user.after_create")
      # redirect_to admin_user_path(@user)
      respond_with @user, :admin
    else
      flash[:failure] = t("user.fail_create")
      render :action => "new"
            #respond_with @user
    end
  end
  
  def edit
      @user = User.find_by_id(params[:id])
      flash[:notice] = t("user.before_update")
      respond_with @user, :admin
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = t("user.after_update")
     # redirect_to edit_admin_user_path(@user)
      respond_with @user, :admin
    else
      flash[:failure] = t("user.fail_update")
      render :action => "edit"
      #respond_with @user
    end
  end
  
  def delete
    @user = User.find_by_id(params[:id])  
    flash[:notice] = t("user.before_destroy")
    respond_with @user, :admin
  end
  
  def destroy
    @user = User.find_by_id(params[:id])  
    if @user.destroy
      flash[:success] = t("user.after_destroy")
      redirect_to admin_users_path      
    else
      flash[:failure] = t("user.fail_destroy")
      respond_with @user, :admin
    end
  end
end
