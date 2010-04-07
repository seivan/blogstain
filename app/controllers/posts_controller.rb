class PostsController < ApplicationController
  
  def index
    #  scope :published, where(:published => true)
    @posts = Post.published
  end
  
  def show
    @post = Post.find_by_id params[:id]
  end
  
end