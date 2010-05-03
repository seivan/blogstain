class Page < Content
  #Validations
  validates :title, :uniqueness => true
  #Scopes
  #scope :published_is_true, where(:published => true)
  scope :published, where(:published => true)
  scope :line_order_asc, order("line_order ASC")
  
  # def current_time_shown
  #   if created_at >= updated_at
  #     created_at
  #   else
  #     updated_at
  #   end
  # end


  #Methods  # 
    # def self.find_by_slug!(params)
    #     @page = Page.find_by_slug(params)
    #   raise ActiveRecord::RecordNotFound, "Page not found" if @page.nil?
  #private
  def to_param
    self.slug
  end
end
