require 'rails_helper'

RSpec.describe Meeting, :type => :model do
  describe "#validations" do
    let(:meeting) { FactoryGirl.build(:meeting) }

    it "builds a valid object" do
      expect(meeting).to be_valid
    end

    it "requires a valid user" do
      meeting.user = nil
      expect(meeting).not_to be_valid
    end

    it "requires a description" do
      meeting.description = nil
      expect(meeting).not_to be_valid
    end
  end
end
