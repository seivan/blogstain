class Post < Content
  def self.per_page
    10
  end
  
  def self.fetch_posts_archive(params)
    if params[:year] && params[:month]
      @posts = Post.published_is_true.date_is(:year, params[:year]).date_is(:month, Date::MONTHNAMES[params[:month]])
    elsif params[:year]
      @months = Post.published_is_true.date_is(:year, params[:year]).unique_date_with(:month).map do |content|
        Date::MONTHNAMES[content.date.to_i]
      end
    else  
      @archives ||= Post.published_is_true.unique_date_with(:year)
    end
  end
  
  def to_param
    self.slug
  end
  
end
