class Post < Content
  #Scopes
  scope :published, where(:published => true)
  
  #Associations 
  
  #Validations
  
  #Callbacks
  
  
  def self.per_page
    50
  end
end
