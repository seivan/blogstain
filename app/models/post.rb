class Post < Content
  #Scopes

  
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
