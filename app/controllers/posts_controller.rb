class PostsController < ApplicationController
  respond_to :html, :json, :atom
  
  def index
    # scope :published, where(:published => true)
    @posts = Post.published.paginate(:page => params[:page], :order => 'created_at DESC')
    respond_with @posts
  end
  
  def show
    @post = Post.find_by_id params[:id]
    respond_with @post
  end
  
end