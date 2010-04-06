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

# == Schema Information
#
# Table name: posts
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  content      :text
#  content_html :text
#  commentable  :boolean(1)
#  published    :boolean(1)
#  user_id      :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

