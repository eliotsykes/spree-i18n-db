require File.dirname(__FILE__) + '/../spec_helper'

describe Translation do
  before(:each) do
    @translation = Translation.new
  end

  it "should be valid" do
    @translation.should be_valid
  end
end
