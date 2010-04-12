class Page < Content
  #Validations
  validates :title, :uniqueness => true
  #Scopes
  scope :published, where(:published => true).order("order DESC")
  scope :blog, where(:slug => "blog", :published => true).first
  
  
  #Methods  # 
    # def self.find_by_slug!(params)
    #     @page = Page.find_by_slug(params)
    #   raise ActiveRecord::RecordNotFound, "Page not found" if @page.nil?
  #private
  def to_param
    self.slug
  end
end
