class Post < Content
  #Scopes
  scope :published, where(:published => true).order("created_at DESC")
  
  #Associations 
  
  #Validations
  #Callbacks
  
  
  
  def self.per_page
    10
  end
  
  #Methods
  #private
  def to_param
    self.slug
  end
end
