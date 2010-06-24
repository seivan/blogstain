class Page < Content
  
  validates :title, :uniqueness => true
  scope :published, where(:published => true)
  scope :line_order_asc, order_by([:line_order, :asc])
  # named_scope :line_order_asc, order("line_order ASC")
  #embedded_in :user, :inverse_of => :pages
  def to_param
    self.slug
  end
end
