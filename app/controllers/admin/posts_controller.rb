class Admin::PostsController < Admin::BaseController
  authorize_resource
  respond_to :html, :json, :js
  def index
    @posts = Post.accessible_by(current_ability, :index).after_created_at_desc.paginate(:page => params[:page], :per_page => 30)
    if @posts.blank?
      flash[:notice] = t("post.none") 
    else
      respond_with @posts
    end
  end
  
  def show
    @post = Post.find_by_id params[:id]
    if @post.blank?
      flash[:error] = t("post.not_found") 
    else
      respond_with @post
    end
  end
  
  def new
    @post = Post.new
    flash[:notice] = t("post.before_create")
    respond_with @post
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = t("post.after_create")
      redirect_to edit_admin_post_path(@post)
      respond_with @post
    else
      flash[:failure] = t("post.fail_create")
      render :action => "new"
            respond_with @post
    end
  end
  
  def edit
      @post = Post.find_by_id(params[:id])
      flash[:notice] = t("post.before_update")
      respond_with @post
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:success] = t("post.after_update")
      redirect_to edit_admin_post_path(@post)
      respond_with @post
    else
      flash[:failure] = t("post.fail_update")
      render :action => "edit"
      respond_with @post
    end
  end
  
  def delete
    @post = Post.find(params[:id])  
    flash[:notice] = t("post.before_destroy")
    respond_with @post
  end
  
  def destroy
    if @post.destroy
      flash[:success] = t("post.after_destroy")
      redirect_to admin_posts_path      
    else
      flash[:failure] = t("post.fail_destroy")
      redirect_to(@post)
      respond_with @post
    end
  end
  
end
