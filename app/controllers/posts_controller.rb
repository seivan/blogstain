class PostsController < ApplicationController
 # authorize_resource
  respond_to :html, :json, :atom, :js

  def index
    @posts = Post.accessible_by(current_ability, :index).
                  published_is_true.
                  after_created_at_desc.
                  paginate(:page => params[:page], :per_page => 10)
    respond_with @posts
  end
  
  def show
    @post = Post.published_is_true.find_by_id params[:id]
    respond_with @post
  end
   # def new
   #     @post = Post.new
   #     flash[:notice] = t("post.before_create")
   #     respond_with @post
   #   end
   #   
   #   def create
   #     #debugger
   #     @post = Post.new(params[:post])
   #     if @post.save
   #       flash[:success] = t("post.after_create")
   #       redirect_to @post
   #       #respond_with @post
   #     else
   #       flash[:failure] = t("post.fail_create")
   #       render :action => "new"
   #             respond_with @post
   #     end
   #   end
end