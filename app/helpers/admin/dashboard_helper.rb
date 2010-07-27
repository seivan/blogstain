module Admin::DashboardHelper
  
  def create_statistics
    t("admin_page.statistics",  :posts => pluralize(Post.count, t("post.post")),
                                              :comments => pluralize(Comment.count, t("comment.comment")),
                                              :users => pluralize(User.where(:role => "user").count, t("user.user")),
                                              :guests =>  pluralize(User.where(:role => "guest").count, t("user.guest"))
                                              )
    
  end
end
