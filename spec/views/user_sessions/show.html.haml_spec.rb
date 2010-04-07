require 'spec_helper'

describe "user_sessions/show.html.haml" do
  before(:each) do
    assign(:user_session, @user_session = stub_model(UserSession)
  end

  it "renders attributes in <p>" do
    render
  end
end
