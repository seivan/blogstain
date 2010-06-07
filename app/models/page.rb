class Page < Content
  has_many :comments, :as => :commentable
  validates :title, :uniqueness => true
  scope :published, where(:published => true)
  scope :line_order_asc, order("line_order ASC")
  
  def to_param
    self.slug
  end
end
