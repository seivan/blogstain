require 'spec_helper'

describe "comments/index.html.haml" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :content => "MyText",
        :commentable_id => 1,
        :commentable_type => "MyString",
        :user_id => 1
      ),
      stub_model(Comment,
        :content => "MyText",
        :commentable_id => 1,
        :commentable_type => "MyString",
        :user_id => 1
      )
    ])
  end

  it "renders a list of comments" do
    render
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
