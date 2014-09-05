require 'rails_helper'

RSpec.describe "meetings/index", :type => :view do
  before(:each) do
    assign(:meetings, [
      FactoryGirl.create(:meeting),
      FactoryGirl.create(:meeting)
    ])
  end

  it "renders a list of meetings" do
    render
    assert_select "tr>td", :text => "My important meeting".to_s, :count => 2
  end
end
