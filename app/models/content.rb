class Content < ActiveRecord::Base
    attr_protected :created_at, :updated_at, :user_id
end
