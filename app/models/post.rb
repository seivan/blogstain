class Post < Content
  def self.per_page
    10
  end
  
  def self.get_posts_or_archive(params)
    if params[:year] && params[:month]
      Post.published.
        date_is(:year, params[:year]).
        date_is(:monthname, params[:month]).
        created_at_desc.paginate(:page => params[:page], :per_page => 10)
    else
       Post.published.
        created_at_desc.
        paginate(:page => params[:page], :per_page => 10)
    end
  end
  #accessible_by(current_ability, :index).
  def to_param
    self.slug
  end
  
end
