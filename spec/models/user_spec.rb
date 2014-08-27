require 'rails_helper'

describe User do
  it "builds a valid object" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
end
