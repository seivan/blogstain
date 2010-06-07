class Admin::UsersController <  Admin::BaseController
  #authorize_resource
  respond_to :html, :json, :js
  def index
    @users = User.accessible_by(current_ability, :index).after_role_desc
    respond_with :admin, @users
  end
  
  def show
    @user = User.find_by_id params[:id]
    if @user.blank?
      flash[:error] = t("user.not_found") 
      respond_with :admin, @user
    else
      respond_with :admin, @user
    end
  end
  
  def new
    @user = User.new
    flash[:notice] = t("user.before_create")
    respond_with :admin, @user
  end
  
  def create
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        flash[:success] = t("user.after_create")
        # redirect_to admin_user_path(@user)
        respond_with :admin, @user
      else
        flash[:failure] = t("user.fail_create")
        render :action => "new"
            #respond_with @user
      end
    end
  end
  
  def edit
      @user = User.find_by_id(params[:id])
      flash[:notice] = t("user.before_update")
      respond_with :admin, @user
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = t("user.after_update")
     # redirect_to edit_admin_user_path(@user)
      respond_with :admin, @user
    else
      flash[:failure] = t("user.fail_update")
      render :action => "edit"
      #respond_with @user
    end
  end
  
  def delete
    @user = User.find_by_id(params[:id])  
    flash[:notice] = t("user.before_destroy")
    respond_with :admin, @user
  end
  
  def destroy
    @user = User.find_by_id(params[:id])  
    if @user.destroy
      flash[:success] = t("user.after_destroy")
      redirect_to admin_users_path      
    else
      flash[:failure] = t("user.fail_destroy")
      respond_with :admin, @user
    end
  end
end
