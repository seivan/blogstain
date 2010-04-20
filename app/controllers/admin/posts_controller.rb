class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.published.ordered_desc.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @post = Post.find_by_id params[:id]
    respond_with @post
  end
end