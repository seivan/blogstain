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

# == Schema Information
#
# Table name: banneds
#
#  id         :integer(4)      not null, primary key
#  ip         :string(255)
#  created_at :datetime
#  updated_at :datetime
#

