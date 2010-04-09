class Content < ActiveRecord::Base
    attr_protected :created_at, :updated_at, :user_id
    belongs_to :user
    
    #scopes
    scope :recent, order("created_at DESC")
end
