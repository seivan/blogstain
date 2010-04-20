class PostsController < ApplicationController
  authorize_resource
  respond_to :html, :json, :atom, :js

  def index
    @posts = Post.accessible_by(current_ability, :index).
                  published_is_true.
                  after_created_at_desc.
                  paginate(:page => params[:page], :per_page => 10)
    respond_with @posts
  end
  
  def show
    @post = Post.find_by_id params[:id]
    respond_with @post
  end
  
end