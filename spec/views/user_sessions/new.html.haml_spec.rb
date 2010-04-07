require 'spec_helper'

describe "user_sessions/new.html.haml" do
  before(:each) do
    assign(:user_session, stub_model(UserSession,
      :new_record? => true
    ))
  end

  it "renders new user_session form" do
    render

    response.should have_selector("form", :action => user_sessions_path, :method => "post") do |form|
    end
  end
end
