class Post < ActiveRecord::Base
  #attr_accessible :title, :content, :commentable, :published, :user_id
  belongs_to :user
  #has_many :comments, :as => :commentable
  
  def self.per_page
    10
  end
  def to_param
    "#{id}-#{title.parameterize}"
  end

end
