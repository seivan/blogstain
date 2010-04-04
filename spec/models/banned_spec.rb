require 'spec_helper'

describe Banned do
  before(:each) do
    @valid_attributes = {
      :ip => "value for ip"
    }
  end

  it "should create a new instance given valid attributes" do
    Banned.create!(@valid_attributes)
  end
end
