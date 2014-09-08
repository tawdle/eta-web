require 'rails_helper'

RSpec.describe "meetings/new", :type => :view do
  before(:each) do
    assign(:meeting, FactoryGirl.build(:meeting))
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", meetings_path, "post" do

      assert_select "input#meeting_description[name=?]", "meeting[description]"
      assert_select "input#meeting_location[name=?]", "meeting[location]"
    end
  end
end
