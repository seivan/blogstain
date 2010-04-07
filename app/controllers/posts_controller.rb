class PostsController < ApplicationController
  
  def index
    @posts = Post.published.all
  end
  
  def show
    @post = Post.find_by_id params[:id]
  end
  
end