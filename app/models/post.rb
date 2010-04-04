class Post < ActiveRecord::Base
  #attr_accessible :title, :content, :commentable, :published, :user_id
  belongs_to :user
end
