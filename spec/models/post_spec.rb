require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  it "should be valid" do
    Post.new.should be_valid
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

