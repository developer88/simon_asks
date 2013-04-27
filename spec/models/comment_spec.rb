require "spec_helper"

describe SimonAsks::Comment do

  describe "structure" do

    it { should belong_to(:owner) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:content) }

  end

  describe "validations" do

    it "should be passed" do
      comment = SimonAsks::Comment.new
      comment.content = "This is a comment"
      comment.valid?.should be_true
    end

    it "should not be passed " do
      comment = SimonAsks::Comment.new
      comment.valid?.should_not be_true
    end

  end
end