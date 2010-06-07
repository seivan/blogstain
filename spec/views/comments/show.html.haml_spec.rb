require 'spec_helper'

describe "comments/show.html.haml" do
  before(:each) do
    assign(:comment, @comment = stub_model(Comment,
      :content => "MyText",
      :commentable_id => 1,
      :commentable_type => "MyString",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
   rendered.should contain("MyText")
   rendered.should contain(1)
   rendered.should contain("MyString")
   rendered.should contain(1)
  end
end
