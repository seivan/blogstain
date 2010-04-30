class Post < Content
  def self.per_page
    10
  end
  
  def self.fetch_posts_archive(params)
    if params[:year] && params[:month]
      Post.published_is_true.date_is(:year, params[:year]).date_is(:month, Date::MONTHNAMES.find_index(params[:month]))
    elsif params[:year]
      Post.published_is_true.date_is(:year, params[:year]).unique_date_with(:month).map { |content| Date::MONTHNAMES[content.date.to_i] }
    end
  end
  
  def to_param
    self.slug
  end
  
end
