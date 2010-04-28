class PostsController < ApplicationController
 # authorize_resource
  respond_to :html, :json, :atom, :js
  before_filter :fetch_posts_archive
  def index
    if params[:year]
       @months = Post.where('YEAR(created_at) = ?', params[:year]).select('MONTH(created_at) as created_month').group('created_month').order('created_month ASC')
    end
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
  
  private
  def fetch_posts_archive
    @archives = Post.select('YEAR(created_at) as created_year').group('created_year').order('created_year ASC')
  end
end