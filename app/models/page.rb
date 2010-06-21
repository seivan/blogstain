class Page < Content
  validates :title, :uniqueness => true
  named_scope :published, where(:published => true)
  # named_scope :line_order_asc, order("line_order ASC")
  embedded_in :user, :inverse_of => :pages
  def to_param
    self.slug
  end
end
