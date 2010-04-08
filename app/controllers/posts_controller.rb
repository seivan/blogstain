class PostsController < ApplicationController
  respond_to :html, :json, :atom, :js

  def index
    @posts = Post.published.recent.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @post = Post.find_by_id params[:id]
    respond_with @post
  end
  
end