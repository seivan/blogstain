class Post < Content
  
  has_many :comments, :as => :commentable
  acts_as_taggable
  scope :published, where(:published => true)
  scope :archives, select("DISTINCT(date_format(created_at,_utf8'%Y %M')) as year_and_month")
  scope :date_is, lambda {|period,date| where("#{period.to_s.upcase}(created_at) = ?", date)}  
  scope :created_at_desc, order("created_at DESC")
  #accepts_nested_attributes_for :comments, :allow_destroy => :true#,:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
      
  def self.get_posts_or_archive_or_tags(params)
    #accessible_by(current_ability, :index)
    if params[:year] && params[:month]
      Post.published.
        date_is(:year, params[:year]).
        date_is(:monthname, params[:month]).
        created_at_desc.paginate(:page => params[:page], :per_page => 10)
    elsif params[:tag]
      Post.tagged_with(params[:tag]).published.
        created_at_desc.
        paginate(:page => params[:page], :per_page => 10)
    else
       Post.published.
        created_at_desc.
        paginate(:page => params[:page], :per_page => 10)
    end
  end
  
  
  def self.get_related_posts(tags, excluded_post)
    posts = Post.published.created_at_desc.limit(5).tagged_with(tags, :all => true)
    begin
      posts - [excluded_post]
    rescue NoMethodError
      []
    end
  end

  def to_param
    self.slug
  end
  

  
end
