require 'spec_helper'

describe "comments/edit.html.haml" do
  before(:each) do
    assign(:comment, @comment = stub_model(Comment,
      :new_record? => false,
      :content => "MyText",
      :commentable_id => 1,
      :commentable_type => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    rendered.should have_selector("form", :action => comment_path(@comment), :method => "post") do |form|
      form.should have_selector("textarea#comment_content", :name => "comment[content]")
      form.should have_selector("input#comment_commentable_id", :name => "comment[commentable_id]")
      form.should have_selector("input#comment_commentable_type", :name => "comment[commentable_type]")
      form.should have_selector("input#comment_user_id", :name => "comment[user_id]")
    end
  end
end
