class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  #Scopes
  scope :created_at_desc, order("created_at DESC")
end
