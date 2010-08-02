class Admin::DashboardController < Admin::BaseController
  #authorize_resource
  def show
    @latest_posts = Post.limit(5).created_at_desc
    @latest_users = User.limit(5).created_at_desc
    @latest_comments = Comment.limit(10).created_at_desc
  end
end



