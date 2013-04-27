require "spec_helper"

describe SimonAsks::Question do
  before :all do
    #@question = create :question
  end

  describe "structure" do

    it { should belong_to(:user) }
    it { should have_many(:answers) }
    it { should have_many(:comments) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:tag_list) }
    it { should validate_presence_of(:content) }

  end

  describe "validations" do
    it "should be passed" do
      question = SimonAsks::Question.new
      question.title = "New Question"
      question.tag_list = "tag1, tag2"
      question.content = "This is a question"
      question.valid?.should be_true
    end

    it "should not be passed " do
      question = SimonAsks::Question.new
      question.tag_list = "tag1, tag2"
      question.content = "This is a question"
      question.valid?.should_not be_true
    end

  end
end