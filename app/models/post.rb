class Post < Content
  #Scopes
  scope :published, where(:published => true).order("created_at DESC")
  
  #Associations 
  
  #Validations
  #Callbacks
  
  
  
  def self.per_page
    10
  end
  
  def to_param
    "#{id} - #{}"
  end
end
