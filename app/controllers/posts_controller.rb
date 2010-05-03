class PostsController < ApplicationController
  # authorize_resource
  respond_to :html, :json, :atom, :js
  before_filter do
      @archives ||= Post.published.archives.created_at_desc
  end
  def index
    @posts = Post.get_posts_or_archive(params)
    respond_with @posts
  end
  
  def show
    @post = Post.published.find_by_id params[:id]
    respond_with @post
  end
  
end