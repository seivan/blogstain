class Content < ActiveRecord::Base
  attr_protected :created_at, :updated_at, :user_id
    
  #Validations
  validates :title, :presence => true

    
  #Associations
  belongs_to :user
    
    
  #Scopes
  scope :ordered_desc, order("created_at DESC")
    
    
  #Callbacks
  before_update :update_slug
  after_create :create_slug

  private
  def set_slug
    if self.type == "Page"
      self.slug = "#{title.parameterize }"
    else
      self.slug = "#{id}-#{title.parameterize}"
    end
    self.slug
  end

  def update_slug
    set_slug
  end

  def create_slug
    update_attribute(:slug, set_slug)
  end
  
    
end
