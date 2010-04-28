class Content < ActiveRecord::Base
  attr_protected :created_at, :updated_at, :user_id
    
  #Validations
  validates :title, :presence => true

    
  #Associations
  belongs_to :user
    
    
  #Scopes
  scope :published_is_true, where(:published => true)
  scope :after_created_at_desc, order("created_at DESC")
    
    
  #Callbacks
  before_update :update_slug
  after_create :create_slug
  before_save :prepare_body_html
  
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
  
  def prepare_body_html
    self.body_html = body
  end
end
