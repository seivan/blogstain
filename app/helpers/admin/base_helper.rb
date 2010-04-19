module Admin::BaseHelper
    
  def statistics
    @published_posts = Post.published.all.count
    t("admin.statistics", :is_or_are          => t("is_or_are_counter", :count => @published_posts),
                          :published_posts    => t("posts_counter", :count =>  @published_posts),
                          :comments      => t("comments_counter", :count => Comment.published.all),
                          :unpublished_comments      => t("unpublished_comments_counter", :count => Comment.unpublished.all),
                          :users              => t("users_counter", :count => User.users.all.count),
                          :guests              => t("guests_counter", :count => User.guests.all.count))
                          
  end
end
