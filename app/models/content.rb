class Content < ActiveRecord::Base
  attr_protected :created_at, :updated_at, :user_id
  validates :title, :presence => true
  belongs_to :user
    
    

  
  
  
  #scope :archives, select("DISTINCT(CONCAT_WS(' ', YEAR(created_at), MONTHNAME(created_at))) as date")  
  
  #scope :unique_date_with, lambda {|period| select("DISTINCT(#{period.to_s.upcase}(created_at)) as date") }
  
  #where('YEAR(created_at) = ?', params[:year]).select('MONTH(created_at) as created_month').group('created_month').order('created_month ASC')

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
