require "spec_helper"

describe SimonAsks::QuestionAnswer do

  describe "structure" do

    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should have_many(:comments) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:content) }

  end

  describe "validations" do

    it "should be passed" do
      question = create :question
      answer = SimonAsks::QuestionAnswer.new
      #question.user = 
      answer.question = question
      answer.content = "This is an answer"
      answer.valid?.should be_true
    end

    it "should not be passed " do
      answer = SimonAsks::Question.new
      answer.content = "This is an answer"
      answer.valid?.should_not be_true
    end

  end
end